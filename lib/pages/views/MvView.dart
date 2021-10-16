import 'package:video_player/video_player.dart';
import 'package:audio_video_player3/pages/detailpages/Mv_detailPage.dart';
import 'package:flutter/material.dart';

class MvView extends StatefulWidget {
  const MvView({Key? key}) : super(key: key);

  @override
  State<MvView> createState() => _MvViewState();
}

class _MvViewState extends State<MvView> {

  List<Map<String, dynamic>> videoDatas = [

    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2017/01/18/17/14/girl-1990347__340.jpg',
      'url' : 'videos/FogTL.mp4',
      'check' : false,
      'favorite' : false,
    },
    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2017/11/02/20/31/guitars-2912447__480.jpg',
      'url' : 'videos/realshort.mp4',
      'check' : false,
      'favorite' : false,
    },
    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2016/01/14/06/09/woman-1139397__480.jpg',
      'url' : 'videos/AntiguaArchTL.mp4',
      'check': false,
      'favorite' : false,
    },
  ];

  String mvTitle = "Video";

  int? prevClickIndex;

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: this.videoDatas.length,
      itemBuilder: (BuildContext context, int i){
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () async{
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => MvDetailPage(
                            mvTitle: this.mvTitle,
                            videoDatas: this.videoDatas,
                            prevClickIndex: i,
                          )
                        )
                      );
                      setState(() {});
                      print("push");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width/1.8,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(this.videoDatas[i]["thumbnail"])
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( top: screenHeight/4.1, left: screenWidth/1.1),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2)
                    ),
                    child: Text(" 4:50 ",style: TextStyle(color: Colors.white),),
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
                            this.videoDatas[i]['favorite'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            color: Colors.deepOrange,
                          ),
                          onPressed: (){
                            setState((){
                              this.videoDatas[i]['favorite'] = !this.videoDatas[i]['favorite'];
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
