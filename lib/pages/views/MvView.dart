import 'package:video_player/video_player.dart';
import 'package:audio_video_player3/pages/detailpages/Mv_detailPage.dart';
import 'package:flutter/material.dart';

class MvView extends StatefulWidget {
  const MvView({Key? key}) : super(key: key);

  @override
  State<MvView> createState() => _MvViewState();
}

class _MvViewState extends State<MvView> {

  List<Map<String, dynamic>> videoDatas = [ // 모델링 데이터 4

    {
      'videoTitle' : 'LILAC(라일락)',
      'company' : "토끼콩(Kylie Won's Music)",
      'companyImg':'https://yt3.ggpht.com/ytc/AKedOLR397UeSrsrLTsIMj_4N-3X9tsc5_kHXiHKUCew=s48-c-k-c0x00ffffff-no-rj',
      'viewCount' : '조회수',
      'thumbnail' : 'https://cdn.pixabay.com/photo/2017/01/18/17/14/girl-1990347__340.jpg',
      'url' : 'https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/%5BMV%5D%20IU(%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%B2)_LILAC(%E1%84%85%E1%85%A1%E1%84%8B%E1%85%B5%E1%86%AF%E1%84%85%E1%85%A1%E1%86%A8).mp4?alt=media&token=41e01c03-e376-49e0-b538-490443c5fc23',
      'check' : false,
      'favorite' : false,
    },
    {
      'videoTitle' : 'BBIBBI(삐삐)',
      'company' : "토끼콩(Kylie Won's Music)",
      'companyImg':'https://yt3.ggpht.com/ytc/AKedOLR397UeSrsrLTsIMj_4N-3X9tsc5_kHXiHKUCew=s48-c-k-c0x00ffffff-no-rj',
      'viewCount' : '조회수',
      'thumbnail' : 'https://cdn.pixabay.com/photo/2017/11/02/20/31/guitars-2912447__480.jpg',
      'url' : 'https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/%5BMV%5D%20IU(%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%B2)%20_%20BBIBBI(%E1%84%88%E1%85%B5%E1%84%88%E1%85%B5).mp4?alt=media&token=984c83c6-23e3-41da-be23-7ccbe14b2e5d',
      'check' : false,
      'favorite' : false,
    },
    {
      'videoTitle' : 'Anne-Marie 2002 커버',
      'company' : "토끼콩(Kylie Won's Music)",
      'companyImg':'https://yt3.ggpht.com/ytc/AKedOLR397UeSrsrLTsIMj_4N-3X9tsc5_kHXiHKUCew=s48-c-k-c0x00ffffff-no-rj',
      'viewCount' : '조회수',
      'thumbnail' : 'https://cdn.pixabay.com/photo/2016/01/14/06/09/woman-1139397__480.jpg',
      'url' : 'https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/2002%20cover%20by%20%E1%84%90%E1%85%A9%E1%84%81%E1%85%B5%E1%84%8F%E1%85%A9%E1%86%BC.mp4?alt=media&token=2dbb1fd9-5a74-4247-8991-54db298dd05b',
      'check': false,
      'favorite' : false,
    },
  ];

  String mvTitle = "뮤직비디오";

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
                              image: NetworkImage(this.videoDatas[i]["companyImg"].toString())
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
                                this.videoDatas[i]["videoTitle"].toString(),
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
                              this.videoDatas[i]["company"].toString(),
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
