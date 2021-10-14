
import 'package:audio_video_player3/pages/detailpages/Music_detailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicView extends StatefulWidget {

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final List<Map<String,dynamic>> musicData = [

    {
      'favorite': false,
      "rating": "4.5",
      "title":"THE WATER CURE",
      "text":"Martin Hyatt",
      "img": "images/pic-1.png",
      "audio": "https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/byoyomi_20_4.mp3?alt=media&token=04b443f0-2f57-4d4c-a03f-9ce938370bfc"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"PEACE LIFE",
      "text":"Hazard Bin",
      "img": "images/pic-2.png",
      "audio": "https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/byoyomi_20_4.mp3?alt=media&token=04b443f0-2f57-4d4c-a03f-9ce938370bfc"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"Day Remember",
      "text":"Nicholos",
      "img": "images/pic-3.png",
      "audio": "https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/byoyomi_20_4.mp3?alt=media&token=04b443f0-2f57-4d4c-a03f-9ce938370bfc"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"France",
      "text":"Paris",
      "img": "images/pic-3.png",
      "audio": "https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/byoyomi_20_4.mp3?alt=media&token=04b443f0-2f57-4d4c-a03f-9ce938370bfc"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"Germany",
      "text":"Berlin",
      "img": "images/pic-5.png",
      "audio": "https://firebasestorage.googleapis.com/v0/b/testsnslogin-13c83.appspot.com/o/byoyomi_20_4.mp3?alt=media&token=04b443f0-2f57-4d4c-a03f-9ce938370bfc"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"Italy",
      "text":"Rome",
      "img": "images/pic-1.png",
      "audio": "https://st.bslmeiyu.com/uploads/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85SBS%E7%B3%BB%E5%88%97/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85%E8%8B%B1%E8%AF%AD%E6%95%99%E7%A8%8B%E7%AC%AC1%E5%86%8C_V2/%E5%AD%A6%E7%94%9F%E7%94%A8%E4%B9%A6/P150_Chapter%2016_1Model%20Conversation.mp3"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"Switzerland",
      "text":"Bern",
      "img": "images/pic-1.png",
      "audio": "https://st.bslmeiyu.com/uploads/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85SBS%E7%B3%BB%E5%88%97/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85%E8%8B%B1%E8%AF%AD%E6%95%99%E7%A8%8B%E7%AC%AC1%E5%86%8C_V2/%E5%AD%A6%E7%94%9F%E7%94%A8%E4%B9%A6/P150_Chapter%2016_1Model%20Conversation.mp3"
    },
    {
      'favorite': false,
      "rating": "4.5",
      "title":"Singapore",
      "text":"Singapore",
      "img": "images/pic-1.png",
      "audio": "https://st.bslmeiyu.com/uploads/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85SBS%E7%B3%BB%E5%88%97/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85%E8%8B%B1%E8%AF%AD%E6%95%99%E7%A8%8B%E7%AC%AC1%E5%86%8C_V2/%E5%AD%A6%E7%94%9F%E7%94%A8%E4%B9%A6/P150_Chapter%2016_1Model%20Conversation.mp3"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: this.musicData.length,
        itemBuilder: (BuildContext context, int i)
        => GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MusicDetailPage(
                musicData: this.musicData[i],
                index: i,
              ))
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            height: 120,//MediaQuery.of(context).size.width/2,
            width: 90,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Image.asset(this.musicData[i]["img"]),
                    decoration: BoxDecoration(),
                  ),
                Container(
                  //color: Colors.blue,
                  height: 200,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        //padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "TITLE",
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.green,
                        // padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "SubTitle",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade400
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.blue,
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Text('  4.5',style: TextStyle(color: Colors.pink),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    //color: Colors.red,
                    //padding: EdgeInsets.only(bottom: 5.0),
                      child: IconButton(
                        icon: Icon(
                          this.musicData[i]['favorite'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: Colors.deepOrange,
                        ),
                        onPressed: (){
                          setState((){
                            this.musicData[i]['favorite'] = !this.musicData[i]['favorite'];
                          });
                        },
                      ),
                  ),
                ),
              ],
            )
          ),
        )
      ),
    );
  }
}
