import 'package:audio_video_player3/pages/HomePage.dart';
import 'package:audio_video_player3/pages/LoginPage.dart';
import 'package:audio_video_player3/pages/detailpages/Mv_detailPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(System());

class System extends StatelessWidget {
  const System({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


