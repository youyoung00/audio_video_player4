import 'package:audio_video_player3/models/videodatamodel.dart';
import 'package:audio_video_player3/pages/views/MvView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class MvDetailPage extends StatefulWidget {
  List<VideoDataDetailModel> videoDatas;
  String mvTitle;
  int prevClickIndex;
  MvDetailPage({Key? key, required this.videoDatas, required this.prevClickIndex, required this.mvTitle}) : super(key: key);

  @override
  _MvDetailPageState createState() => _MvDetailPageState();
}

class _MvDetailPageState extends State<MvDetailPage> {

  @override
  Widget build(BuildContext context) {
    print(widget.videoDatas.length);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (BuildContext context) => MvView(),
                )
              );
            },
          ),
        ),
        backgroundColor: Colors.redAccent,
        title: Text(this.widget.mvTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: this.widget.videoDatas.length,
          itemBuilder: (BuildContext context, int index) =>
              Views( mvDataIndex: this.widget.videoDatas[index],
            onPressed: (VideoPlayerController ct) async{
              if(this.widget.prevClickIndex != null) this.widget.videoDatas[this.widget.prevClickIndex].check = true;
              ct.value.isPlaying ? await ct.pause() : await ct.play();
              this.setState(() {
                this.widget.videoDatas[index].check = false;
                this.widget.prevClickIndex = index;
              });
              return;
            },
          )
      ),
    );
  }
}

class Views extends StatefulWidget {

  VideoDataDetailModel mvDataIndex;

  Future<void> Function(VideoPlayerController ct) onPressed;
  Views({Key? key, required this.mvDataIndex, required this.onPressed}) : super(key: key);

  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      _controller = VideoPlayerController.network(this.widget.mvDataIndex.url.toString())..initialize();
      _controller?.addListener(() {
        if(this._controller!.value.isInitialized) {
          if (!this.mounted) return;
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    this._controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mvDataIndex.check) {
      if (_controller != null) {
        _controller!.pause();
      }
    }
    return (this._controller == null)
        ? Center(child: Text("Controller Load..."),)
        : _controller!.value.isInitialized
        ? Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width/1.5,
                color: Colors.grey,
                child: AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.mvDataIndex.thumbnail.toString()),
                                fit: BoxFit.cover
                            )
                        ),
                        child: this._controller!.value.isPlaying ? VideoPlayer(_controller!) : Container()
                    )
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    alignment: Alignment.centerRight,
                    child: this._videoCt()
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 24),
            //color: Colors.blue,
            //height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(this.widget.mvDataIndex.companyImg.toString())
                      )
                  ),
                ),
                Container(
                  //color: Colors.red,
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        //color: Colors.red,
                          margin: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            this.widget.mvDataIndex.videoTitle.toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        //color: Colors.blue,
                        child: Text(
                          this.widget.mvDataIndex.company.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.red,
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(
                        this.widget.mvDataIndex.favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: Colors.deepOrange,
                      ),
                      onPressed: (){
                        setState((){
                          this.widget.mvDataIndex.favorite = !this.widget.mvDataIndex.favorite;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    )
        : Container(child: Text("Await..."),);
  }

  Widget _videoCt() => Container(
    width: 50.0,
    height: 50.0,
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50.0)
    ),
    child: IconButton(
        color: Colors.white,
        icon: Icon(this._controller!.value.isPlaying ? Icons.pause : Icons
            .play_arrow,),
        onPressed: () async => await widget.onPressed(this._controller!)
    ),
  );
}

