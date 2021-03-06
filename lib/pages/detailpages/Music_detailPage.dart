import 'package:audio_video_player3/models/musicdatamodel.dart';
import 'package:audio_video_player3/players/audiofile.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicDetailPage extends StatefulWidget {
  final MusicDataModel musicData;
  final int index;
  const MusicDetailPage({Key? key, required this.index, required this.musicData}) : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {

  AudioPlayer? advancedPlayer;


  @override
  void initState(){
    advancedPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("오디오 주소 확인:${this.widget.musicData["audio"]}");
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
      Colors.grey.shade200,
      body:/// 여기부터
          Stack(
            children: [
              Positioned(
                  top:0,
                  left: 0,
                  right: 0,
                  height: screenHeight/3,
                  child: Container(
                    color: Colors.deepPurpleAccent,
                  )
              ),
              Positioned(
                  top:0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    leading: IconButton(
                      icon:Icon(Icons.arrow_back_ios,),
                      onPressed: (){
                        Navigator.of(context).pop();
                        advancedPlayer!.stop();
                      },
                    ),
                    actions: [
                      IconButton(
                        icon:Icon(Icons.search,),
                        onPressed: (){},
                      )
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  )
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: screenHeight*0.2,
                  height: screenHeight*0.34,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:Colors.white,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight*0.1,),
                            Text(
                              this.widget.musicData.title.toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir",
                              ),
                            ),
                            Text(
                              this.widget.musicData.singer,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            AudioFile(advancedPlayer: this.advancedPlayer!, audioPath: this.widget.musicData.audio.toString()),
                          ],
                        ),
                      )

                  )),
              Positioned(
                  top: screenHeight*0.12,
                  left: (screenWidth-150)/2,
                  right: (screenWidth-150)/2,
                  height: screenHeight*0.16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:Colors.white, width: 2),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color:Colors.white, width: 5),
                            image: DecorationImage(
                                image: AssetImage(this.widget.musicData.img.toString()),
                                fit:BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  )
              ),
              Positioned(
                top: 500,
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Text("가사",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          child: Text(
                            this.widget.musicData.lyrics.toString(),
                          ),
                        ),
                        Container(
                          child: Text(
                            this.widget.musicData.songInfo.toString(),
                          ),
                        ),
                      ],
                    ),
                    //color: Colors.red,
                  ),
                ),
              )
            ],
          ),

    );
  }
}
