import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class MvDetailPage extends StatefulWidget {
  List<Map<String,dynamic>> videoDatas;
  String mvTitle;
  int prevClickIndex;
  MvDetailPage({Key? key, required this.videoDatas, required this.prevClickIndex, required this.mvTitle}) : super(key: key);

  @override
  _MvDetailPageState createState() => _MvDetailPageState();
}

class _MvDetailPageState extends State<MvDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            // favorite: this.widget.videoDatas[index]['favorite'],
            // thumbnail: this.widget.videoDatas[index]['thumbnail'].toString(),
            // url: this.widget.videoDatas[index]['url'].toString(),
            // check: this.widget.videoDatas[index]['check'],
            onPressed: (VideoPlayerController ct) async{
              if(this.widget.prevClickIndex != null) this.widget.videoDatas[this.widget.prevClickIndex]['check'] = true;
              ct.value.isPlaying ? await ct.pause() : await ct.play();
              this.setState(() {
                this.widget.videoDatas[index]['check'] = false;
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

  Map<String,dynamic> mvDataIndex;

  // final String url;
  // final String thumbnail;
  // bool check;
  // bool favorite;
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
      _controller = VideoPlayerController.network(this.widget.mvDataIndex["url"])..initialize();
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
    if (widget.mvDataIndex['check']) {
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
                                image: NetworkImage(widget.mvDataIndex['thumbnail']),
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
            margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 22),
            //color: Colors.blue,
            //height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://cdn.pixabay.com/photo/2021/05/10/14/15/corset-6243486__340.jpg")
                      )
                  ),
                ),
                Container(
                  //color: Colors.red,
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "TITLE",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                      Container(
                        child: Text(
                          "subTxt",
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
                        this.widget.mvDataIndex['favorite'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: Colors.deepOrange,
                      ),
                      onPressed: (){
                        setState((){
                          this.widget.mvDataIndex['favorite'] = !this.widget.mvDataIndex['favorite'];
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

