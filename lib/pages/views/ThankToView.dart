import 'package:audio_video_player3/pages/detailpages/Info_detailPage.dart';
import 'package:flutter/material.dart';

class ThankToView extends StatelessWidget {
  //const ThankToView({Key? key, required this.mainTitle}) : super(key: key);

  List<Map<String,String>> infoList =[
    {
      'contents': '정규',
      'menu': '앨범 종류',
    },
    {
      'menu': '장르',
      'contents': '댄스/팝,발라드,R&B/Soul'
    },
    {
      'menu': '발매일',
      'contents': '2021.10.15'
    },
    {
      'menu': '유통사',
      'contents': '카카오엔터테인먼트'
    },
    {
      'menu': '기획사',
      'contents': 'EDAM 엔터테인먼트'
    },
  ];

  String albumInfo = """‘아이유(IU)’ 정규 5집 [LILAC]

“안녕 꽃잎 같은 안녕”
“내 맘에 아무 의문이 없어 난 이 다음으로 가요”

20대의 마지막에 대해 화려한 ‘인사’를 예고했던 아이유가 봄 내음과 함께 다섯 번째 정규앨범 [LILAC]으로 돌아왔다. 4년 만에 선보이는 정규앨범 [LILAC]은 스무 살의 솔직하고 풋풋한 감성을 담아 발표했던 20대의 첫 앨범 [스무 살의 봄]과는 달리, 지금껏 지나온 20대를 10개의 트랙에 다채로운 시각으로 풀어내 그동안의 성숙해진 감성을 오롯이 담았다.

이번에도 역시 프로듀싱은 물론 작곡 및 전곡 작사에 참여한 아이유는 국내외 다양한 특급 아티스트들과 새로운 협업을 통해 장르에 대한 시도와 완성도 높은 곡들을 선보여 현재 진행형인 아이유의 음악적 진화가 향후 새롭게 맞이할 30대에는 또 어떠한 모습을 보여줄지 기대감도 주고 있다.

또한 이번 앨범에는 국내 최고의 뮤직비디오 프로덕션인 VM프로젝트(Celebrity, Flu), 플립이블(라일락, 에필로그), 써니비주얼(Coin)이 함께 참여하여 각각의 개성 있고 감각적인 영상들과 아이유의 음악이 만나 막강한 시너지를 발휘했다.

앨범명과 함께 타이틀 곡 제목에 사용한 ‘라일락’ 꽃의 꽃말은 ‘첫사랑’, 그리고 ‘젊은 날의 추억’이다. 20대의 첫 페이지부터 마지막 페이지까지 지켜봐 준 모든 이들에게 감사함을 담아 화려하고, 그리고 조금은 쓸쓸하기도 한 아이유만의 인사를 전한다.
""";

  String detailInfo = "... 자세히";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        //elevation: 0,
        backgroundColor: Colors.lightGreen,//Colors.grey.shade100,
        title: Text("LILAC",//style: TextStyle(color: Colors.black)
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20.0, top: 30,),
          width: MediaQuery.of(context).size.width,
          //width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this._albumTitle(),
              this._menuContents(context),
              Container(
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 20
                ),
                child: Column(
                  children: [
                    Text(this.albumInfo),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Text("...더 보기",style: TextStyle(color: Colors.grey.shade600),),
                          Container(
                            width: 60,
                            height: 20,
                            child: TextButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(Size(0.0,0.0)),
                                alignment: Alignment.topLeft,
                              ),
                              child: Text(""),
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (BuildContext context){
                                    return InfoDetailPage();
                                  })
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   color: Colors.green,
                  ],
                )
              )
            ],
          )
        ),
      ),
    );
  }

  Widget _albumTitle()
  => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(padding: EdgeInsets.only(bottom: 10.0), child: Text("LILAC", style: TextStyle(fontSize: 18, fontFamily: 'Avenir'),),),
      Container(padding: EdgeInsets.only(bottom: 10.0), child: Text("아이유(IU)",style: TextStyle(color: Colors.lightGreen),),),
    ],
  );

  Widget _menuContents(BuildContext context)
  => Column(
    children: this.infoList.map<Widget>((Map<String,String> index) => Container(
      child: Row(
        children: [
          Container(
            //color: Colors.red,
            padding: EdgeInsets.only(left: 0),
            width: MediaQuery.of(context).size.width/4-40,
            child: Text(
              index['menu'].toString(),
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14
              ),
            ),
          ),
          Container(
            //color: Colors.green,
            padding: EdgeInsets.only(left: 20),
            //width: 300,
            child: Text(
              index['contents'].toString(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    ),
    ).toList()
  );

}
