import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer? advancedPlayer;
  final String audioPath;
  const AudioFile({Key? key, this.advancedPlayer, required this.audioPath }) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];


  @override
  void initState(){
    super.initState();
    this.widget.advancedPlayer?.onDurationChanged.listen((d) {
      if(!mounted) return;
      setState(() {
      _duration=d;
    });});
    this.widget.advancedPlayer?.onAudioPositionChanged.listen((p) {
      if(!mounted) return;
      setState(() {
      _position=p;
    });});

    this.widget.advancedPlayer?.setUrl(this.widget.audioPath, isLocal: true);
    this.widget.advancedPlayer?.onPlayerCompletion.listen((event) {
      if(!mounted) return; // 리스너에는 마운티드 사용....
      setState(() {
        _position = Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        } else{
          isPlaying=false;
          isRepeat=false;
        }
      });
    });
  }

  Widget btnStart(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false ? Icon(_icons[0], size: 50, color: Colors.blue,) : Icon(_icons[1], size: 50,color: Colors.blue,),
      onPressed: (){
        if(isPlaying == false){
          this.widget.advancedPlayer?.play(this.widget.audioPath, isLocal: true);
          setState(() {
            this.isPlaying = true;
          });
        } else if(isPlaying == true){
          this.widget.advancedPlayer?.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget btnFast(){
    return IconButton(
      icon: ImageIcon(
        AssetImage('images/forward.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: ()async{
        await this.widget.advancedPlayer?.setPlaybackRate(1.5);
        // this.widget.advancedPlayer!.setPlaybackRate(playbackRate: 1.5 );
      },
    );
  }

  Widget btnSlow(){
    return IconButton(
      icon: ImageIcon(
        AssetImage('images/backword.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: ()async{
        await this.widget.advancedPlayer?.setPlaybackRate(0.5);
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
        onPressed: (){},
        icon:   ImageIcon(
          AssetImage('images/loop.png'),
          size: 15,
          color: Colors.black,
        )
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: ImageIcon(
          AssetImage('images/repeat.png'),
          size: 15,
          color: color
      ),
      onPressed: (){
        if(isRepeat==false){
          this.widget.advancedPlayer?.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat=true;
            color=Colors.blue;
          });
        }else if(isRepeat==true){
          this.widget.advancedPlayer?.setReleaseMode(ReleaseMode.RELEASE);
          color=Colors.black;
          isRepeat=false;
        }
      },
    );
  }


  Widget slider(){
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value){
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  Widget loadAsset(){
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btnRepeat(),
            btnSlow(),
            btnStart(),
            btnFast(),
            btnLoop()
          ]
      ),
    );
  }

  void changeToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer?.seek(newDuration);
  }
  @override
  Widget build(BuildContext context) {
    print("오디오경로: ${this.widget.audioPath.toString()}");
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0], style: TextStyle(fontSize: 16),),
                Text(_duration.toString().split(".")[0], style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
