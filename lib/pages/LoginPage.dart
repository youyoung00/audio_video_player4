import 'dart:convert';
import 'package:audio_video_player3/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController idCt = TextEditingController();
  TextEditingController pwCt = TextEditingController();

  FocusNode idF = FocusNode();
  FocusNode pwF = FocusNode();


  @override
  void dispose() {
    this.idCt.dispose();
    this.pwCt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://cdn.pixabay.com/photo/2015/02/10/17/41/red-631346__480.jpg")
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  width: size.width*0.8,
                  height: size.width*0.8,
                  // child: Image.asset(
                  //   "img/pic-1.png",
                  //   //fit: BoxFit.cover,
                  // ),
                ),
                Stack(
                  children: [
                    _inputForm(size),
                    _loginButton(size),
                  ],
                ),
                Container(
                  height: size.height*0.04,
                  //color: Colors.red,
                ),
                Text("Password Hints Are Anniversary."),
                Container(
                  height: size.height*0.05,
                )
              ],
            )
          ],
        )
    );
  }

  Widget _inputForm(Size size){
    return  Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6.0,
        child: Padding(
          padding: EdgeInsets.only(left: 12.0,right: 12.0, top: 12.0, bottom: 40),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: this.idCt,
                  decoration: InputDecoration(
                    labelText: "ID",
                    icon: Icon(
                      Icons.account_circle,
                    ),
                  ),
                  validator: (value){
                    if(value == null){
                      return "아이디를 입력해주세요";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: this.pwCt,
                  decoration: InputDecoration(
                    labelText: "PW",
                    icon: Icon(
                      Icons.vpn_key,
                    ),
                  ),
                  validator: (value){
                    if(value == null){
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(Size size){
    return Positioned(
        left: size.width*0.15,
        right: size.width*0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    )
                )
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onPressed: () async{
              print(this.idCt.text);
              print(this.pwCt.text);
              http.Response res = await http.post(Uri.parse("http://192.168.219.150:3000/login"),
                  body: {'id':this.idCt.text,'pw':this.pwCt.text}
              );
              bool isCheck = json.decode(res.body);
              print(isCheck);
              if(isCheck == false){
                return showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("아이디와 비밀번호를 맞춰보세요"),
                    actions: [
                      TextButton(
                        child: Text("닫기"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              }
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()
                  )
              );
            },
          ),
        )
    );
  }
}
