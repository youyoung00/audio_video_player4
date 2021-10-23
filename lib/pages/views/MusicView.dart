import 'package:audio_video_player3/models/musicdatamodel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:audio_video_player3/pages/detailpages/Music_detailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicView extends StatefulWidget {

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  List<Map<String,dynamic>> musicData = [ //모델링 데이터 2

    {
      'favorite': false,
      "rating": 0.0,
      "title":"2002",
      "singer":"원희영(Kylie Won)",
      "img": "images/iu3.jpeg",
      "audio": "https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_tracks_m4a%2Fwon_track4.mp3?alt=media&token=1454795b-d8a3-4ca5-a524-b4c73b74adcb",
      "lyrics": """
나리는 꽃가루에 눈이 따끔해 (아야)
눈물이 고여도 꾹 참을래
내 마음 한켠 비밀스런 오르골에 넣어두고서
영원히 되감을 순간이니까

우리 둘의 마지막 페이지를 잘 부탁해
어느 작별이 이보다 완벽할까?
Love me only 'til this spring

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

기분이 달아 콧노래 부르네 (랄라)
입꼬리는 살짝 올린 채
어쩜 이렇게 하늘은 더 바람은 또 완벽한 건지
오늘따라 내 모습 맘에 들어

처음 만난 그날처럼 예쁘다고 말해줄래
어느 이별이 이토록 달콤할까?
Love resembles misty dream

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼

너도 언젠가 날 잊게 될까?
지금 표정과 오늘의 향기도?
단잠 사이에 스쳐간 봄날의 꿈처럼

오, 라일락, 꽃이 지는 날 goodbye
너의 대답이 날 울려, 안녕 약속 같은 안녕
하이얀 우리 봄날에 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼 (뜬구름처럼)
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
""",
      "songInfo": """
소스: Musixmatch
작사: Ji Eun Lee / Su Ho Lim / Woong Kim / Jooyoung Kim / Min Hyung Cho
라일락 가사 © Musiccube Inc""",
    },
    {
      'favorite': false,
      "rating": 0.0,
      "title":"호랑수월가",
      "singer":"원희영(Kylie Won)",
      "img": "images/iu3.jpeg",
      "audio": "https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_tracks_m4a%2Fwon_track3.mp3?alt=media&token=bbcb6c8f-885e-4cf2-a14b-8fd604ffc7fb",
      "lyrics": """
나리는 꽃가루에 눈이 따끔해 (아야)
눈물이 고여도 꾹 참을래
내 마음 한켠 비밀스런 오르골에 넣어두고서
영원히 되감을 순간이니까

우리 둘의 마지막 페이지를 잘 부탁해
어느 작별이 이보다 완벽할까?
Love me only 'til this spring

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

기분이 달아 콧노래 부르네 (랄라)
입꼬리는 살짝 올린 채
어쩜 이렇게 하늘은 더 바람은 또 완벽한 건지
오늘따라 내 모습 맘에 들어

처음 만난 그날처럼 예쁘다고 말해줄래
어느 이별이 이토록 달콤할까?
Love resembles misty dream

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼

너도 언젠가 날 잊게 될까?
지금 표정과 오늘의 향기도?
단잠 사이에 스쳐간 봄날의 꿈처럼

오, 라일락, 꽃이 지는 날 goodbye
너의 대답이 날 울려, 안녕 약속 같은 안녕
하이얀 우리 봄날에 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼 (뜬구름처럼)
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
""",
      "songInfo": """
소스: Musixmatch
작사: Ji Eun Lee / Su Ho Lim / Woong Kim / Jooyoung Kim / Min Hyung Cho
라일락 가사 © Musiccube Inc""",
    },
    {
      'favorite': false,
      "rating": 0.0,
      "title": "strawberry moon",
      "singer":"원희영(Kylie Won)",
      "img": "images/iu1.jpeg",
      "audio": "https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_tracks_m4a%2Fwon_track1.m4a?alt=media&token=dadf55ce-31ef-4bf5-8413-0be651da89d5",
      "lyrics": """
나리는 꽃가루에 눈이 따끔해 (아야)
눈물이 고여도 꾹 참을래
내 마음 한켠 비밀스런 오르골에 넣어두고서
영원히 되감을 순간이니까

우리 둘의 마지막 페이지를 잘 부탁해
어느 작별이 이보다 완벽할까?
Love me only 'til this spring

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

기분이 달아 콧노래 부르네 (랄라)
입꼬리는 살짝 올린 채
어쩜 이렇게 하늘은 더 바람은 또 완벽한 건지
오늘따라 내 모습 맘에 들어

처음 만난 그날처럼 예쁘다고 말해줄래
어느 이별이 이토록 달콤할까?
Love resembles misty dream

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼

너도 언젠가 날 잊게 될까?
지금 표정과 오늘의 향기도?
단잠 사이에 스쳐간 봄날의 꿈처럼

오, 라일락, 꽃이 지는 날 goodbye
너의 대답이 날 울려, 안녕 약속 같은 안녕
하이얀 우리 봄날에 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼 (뜬구름처럼)
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
""",
      "songInfo": """
소스: Musixmatch
작사: Ji Eun Lee / Su Ho Lim / Woong Kim / Jooyoung Kim / Min Hyung Cho
라일락 가사 © Musiccube Inc""",
    },
    {
      'favorite': false,
      "rating": 0.0,
      "title":"Flu",
      "singer":"원희영(Kylie Won)",
      "img": "images/iu2.jpeg",
      "audio": "https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_tracks_m4a%2Fwon_track2.m4a?alt=media&token=6be24ea6-b5b8-45dc-b4b7-a3fc7950942b",
      "lyrics": """
나리는 꽃가루에 눈이 따끔해 (아야)
눈물이 고여도 꾹 참을래
내 마음 한켠 비밀스런 오르골에 넣어두고서
영원히 되감을 순간이니까

우리 둘의 마지막 페이지를 잘 부탁해
어느 작별이 이보다 완벽할까?
Love me only 'til this spring

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

기분이 달아 콧노래 부르네 (랄라)
입꼬리는 살짝 올린 채
어쩜 이렇게 하늘은 더 바람은 또 완벽한 건지
오늘따라 내 모습 맘에 들어

처음 만난 그날처럼 예쁘다고 말해줄래
어느 이별이 이토록 달콤할까?
Love resembles misty dream

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼

너도 언젠가 날 잊게 될까?
지금 표정과 오늘의 향기도?
단잠 사이에 스쳐간 봄날의 꿈처럼

오, 라일락, 꽃이 지는 날 goodbye
너의 대답이 날 울려, 안녕 약속 같은 안녕
하이얀 우리 봄날에 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼 (뜬구름처럼)
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
""",
      "songInfo": """
소스: Musixmatch
작사: Ji Eun Lee / Su Ho Lim / Woong Kim / Jooyoung Kim / Min Hyung Cho
라일락 가사 © Musiccube Inc""",
    },
    {
      'favorite': false,
      "rating": 0.0,
      "title":"사랑하게 될 줄 알았어",
      "singer":"원희영(Kylie Won)",
      "img": "images/iu2.jpeg",
      "audio": "https://firebasestorage.googleapis.com/v0/b/won1st-a81a5.appspot.com/o/won_tracks_m4a%2Fwon_track1.m4a?alt=media&token=dadf55ce-31ef-4bf5-8413-0be651da89d5",
      "lyrics": """
나리는 꽃가루에 눈이 따끔해 (아야)
눈물이 고여도 꾹 참을래
내 마음 한켠 비밀스런 오르골에 넣어두고서
영원히 되감을 순간이니까

우리 둘의 마지막 페이지를 잘 부탁해
어느 작별이 이보다 완벽할까?
Love me only 'til this spring

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

기분이 달아 콧노래 부르네 (랄라)
입꼬리는 살짝 올린 채
어쩜 이렇게 하늘은 더 바람은 또 완벽한 건지
오늘따라 내 모습 맘에 들어

처음 만난 그날처럼 예쁘다고 말해줄래
어느 이별이 이토록 달콤할까?
Love resembles misty dream

오, 라일락, 꽃이 지는 날 goodbye
이런 결말이 어울려, 안녕 꽃잎 같은 안녕
하이얀 우리 봄날의 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼

너도 언젠가 날 잊게 될까?
지금 표정과 오늘의 향기도?
단잠 사이에 스쳐간 봄날의 꿈처럼

오, 라일락, 꽃이 지는 날 goodbye
너의 대답이 날 울려, 안녕 약속 같은 안녕
하이얀 우리 봄날에 climax
아, 얼마나 기쁜 일이야

우우우우, 우우우우
Love me only 'til this spring 봄바람처럼
우우우우, 우우우우
Love me only 'til this spring 봄바람처럼

우우우우, 우우우우
Love resembles misty dream 뜬구름처럼 (뜬구름처럼)
우우우우, 우우우우
Love resembles misty dream 뜬구름처럼
""",
      "songInfo": """
소스: Musixmatch
작사: Ji Eun Lee / Su Ho Lim / Woong Kim / Jooyoung Kim / Min Hyung Cho
라일락 가사 © Musiccube Inc""",
    },
  ];

  List<MusicDataModel>? mData;

  @override
  void initState() {
    setState(() {
      this.mData = this.musicData.map<MusicDataModel>((e) => MusicDataModel(
          title: e['title'].toString(),
          favorite: e['favorite'],
          rating: e['rating'],
          singer: e['singer'].toString(),
          img: e['img'].toString(),
          audio: e['audio'].toString(),
          lyrics: e['lyrics'].toString(),
          songInfo: e['singInfo'].toString(),
        )
      ).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return this.mData == null
        ? Center(child: Text("음악 데이터 로딩 중..."),)
        : Container(
      color:  Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: this.mData!.length,
        itemBuilder: (BuildContext context, int i)
        => GestureDetector(
          onTap: ()async{
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MusicDetailPage(
                musicData: this.mData![i],
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
                  width: MediaQuery.of(context).size.width/5,
                    height: 90,
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(this.mData![i].img.toString())
                      )
                    ),
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
                        child: Text("${i.toString()}. ${this.mData![i].title.toString()}",
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
                          this.mData![i].singer.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 22.0,
                              minRating: 0,
                              itemBuilder: (BuildContext context, int i)
                              => Icon(Icons.star, color: Colors.amber,),
                              onRatingUpdate: (rating){
                                setState(() {
                                  // this.musicData[i]['rating'] = rating;
                                  this.mData![i].rating = rating;
                                });
                              },
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  '${this.mData![i].rating}',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16
                                  ),
                                )
                            )
                          ],
                        )
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
                          this.mData![i].favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: Colors.deepOrange,
                        ),
                        onPressed: (){
                          setState((){
                            this.mData![i].favorite = !this.mData![i].favorite;
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