import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoDetailPage extends StatelessWidget {
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,),
            onPressed: (){},
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // child: Opacity(
                  //   opacity: 1.0,
                  // ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/iu_main_img.jpeg'),
                    )
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: MediaQuery.of(context).size.width/2,
                  child: Container(
                    //color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      """20대와 작별하고 
30대를 맞이하며 팬들에게 전하는 메세지""",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
