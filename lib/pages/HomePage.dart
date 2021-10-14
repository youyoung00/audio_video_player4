
import 'package:audio_video_player3/pages/views/MusicView.dart';
import 'package:audio_video_player3/pages/views/MvView.dart';
import 'package:audio_video_player3/pages/views/ThankToView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _topImgs = [
    "images/pic-9.png",
    "images/pic-8.png",
    "images/pic-7.png",
    "images/pic-6.png",
  ];

  final List<Map<String,dynamic>> _centerButtonItem = [
    {
      'txt': 'Music',
      'color': Colors.deepPurpleAccent,
    },
    {
      'txt': 'MV',
      'color': Colors.redAccent,
    },
    {
      'txt': 'Thank To',
      'color': Colors.amberAccent,
    },
  ];



  List<Widget> _views = [
    MusicView(),
    MvView(),
    ThankToView()
  ];

  PageController _musicPageController = PageController();
  PageController _topPageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    this._musicPageController.dispose();
    this._topPageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor:  Colors.grey.shade100,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){},),
          IconButton(icon: Icon(Icons.notifications), onPressed: (){},),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0,bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Music",
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
              ),
              this._topBannerImg(),
              this._centerButtons(),
              this._itemList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBannerImg(){
    return Container(
        height: 180,
        child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: -20,
                  right: 0,
                  child: Container(
                    height: 180,
                    child: PageView.builder(
                        controller: this._topPageController, // 전역변수로 올리기!!
                        itemCount: this._topImgs.length,
                        itemBuilder: (BuildContext context, i)
                        => Container(
                          child: Image.asset(this._topImgs[i].toString()),
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )
                    ),
                  )
              )
            ]
        )
    );
  }

  Widget _itemList(BuildContext context){
    return  Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: this._musicPageController,
          itemCount: this._views.length,
          itemBuilder: (BuildContext context, int i){
            return this._views[i];
          },
        ),
      ),
    );
  }

  Widget _centerButtons(){
    return Container(
      color:  Colors.grey.shade100,
      height: 80,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: this._centerButtonItem.map<Widget>((Map<String,dynamic> item)
          => ElevatedButton(
            onPressed: (){
              if(!this._musicPageController.hasClients) return;
              this._musicPageController.jumpToPage(this._centerButtonItem.indexOf(item));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              backgroundColor: MaterialStateProperty.all(item['color']),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20.0,)),
              fixedSize: MaterialStateProperty.all(Size(120.0, 50),),
            ),
            child: Text(item['txt']),
          )).toList()
      ),
    );
  }
}
