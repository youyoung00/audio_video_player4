import 'package:audio_video_player3/models/videodatamodel.dart';
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
      'url' : 'https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_video%2Fwon_mv1.mp4?alt=media&token=32c8574e-e3f3-443b-9249-3e8ccee24450',
      'check' : false,
      'favorite' : false,
    },
    {
      'videoTitle' : 'BBIBBI(삐삐)',
      'company' : "토끼콩(Kylie Won's Music)",
      'companyImg':'https://yt3.ggpht.com/ytc/AKedOLR397UeSrsrLTsIMj_4N-3X9tsc5_kHXiHKUCew=s48-c-k-c0x00ffffff-no-rj',
      'viewCount' : '조회수',
      'thumbnail' : 'https://cdn.pixabay.com/photo/2017/11/02/20/31/guitars-2912447__480.jpg',
      'url' : 'https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_video%2Fwon_mv1.mp4?alt=media&token=32c8574e-e3f3-443b-9249-3e8ccee24450',
      'check' : false,
      'favorite' : false,
    },
    {
      'videoTitle' : 'Anne-Marie 2002 커버',
      'company' : "토끼콩(Kylie Won's Music)",
      'companyImg':'https://yt3.ggpht.com/ytc/AKedOLR397UeSrsrLTsIMj_4N-3X9tsc5_kHXiHKUCew=s48-c-k-c0x00ffffff-no-rj',
      'viewCount' : '조회수',
      'thumbnail' : 'https://cdn.pixabay.com/photo/2016/01/14/06/09/woman-1139397__480.jpg',
      'url' : 'https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_video%2Fwon_mv1.mp4?alt=media&token=32c8574e-e3f3-443b-9249-3e8ccee24450',
      'check': false,
      'favorite' : false,
    },
  ];

  String mvTitle = "뮤직비디오";
  int prevClickIndex = 0;

  VideoDataModel? videoDataModel;

  @override
  void initState() {
    print("데이터 확인${mvTitle.toString()}");
    setState(() {
      this.videoDataModel = VideoDataModel(
          mvTitle: this.mvTitle,
          prevClickIndex: this.prevClickIndex,
          videoData: this.videoDatas.map<VideoDataDetailModel>(
            (e) => VideoDataDetailModel(
              favorite: e["favorite"],
              check: e['check'],
              company: e['company'].toString(),
              companyImg: e['companyImg'].toString(),
              viewCount: e['viewCount'].toString(),
              url: e['url'].toString(),
              videoTitle: e['videoTitle'].toString(),
              thumbnail: e['thumbnail'].toString(),
            )
          ).toList()
      );
    });
    super.initState();
    print("데이터 확인${videoDataModel}");
  }

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: this.videoDataModel?.videoData.length,
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
                            mvTitle: this.mvTitle.toString(),
                            prevClickIndex: i,
                            videoDatas: this.videoDataModel!.videoData.toList(),
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
                            image: NetworkImage(
                              this.videoDataModel!.videoData[i].thumbnail.toString()
                            )
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
                              image: NetworkImage(this.videoDataModel!.videoData[i].companyImg.toString())
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
                              margin: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                this.videoDataModel!.videoData[i].videoTitle.toString(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text(
                              this.videoDataModel!.videoData[i].company.toString(),
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
                            this.videoDataModel!.videoData[i].favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            color: Colors.deepOrange,
                          ),
                          onPressed: (){
                            setState((){
                              this.videoDataModel!.videoData[i].favorite = !this.videoDataModel!.videoData[i].favorite;
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
