import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:plumber_app/Home.dart';
import 'package:plumber_app/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screensplash extends StatefulWidget {
  @override
  _ScreensplashState createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  bool token = false;
  //
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name');
    token = prefs.getBool('token') ?? false;
    print(token);
    token
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(
                name: name,
              ),
            ))
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
  }

  void initState() {
    super.initState();

    // Timer(Duration(seconds: 3), () {
    //   if (FirebaseAuth.instance.currentUser == null) {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => Login(),
    //         ));
    //   } else {
    //     getToken();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: AppBar(
            backgroundColor: Color(0XFF273773),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage('assets/Logo.png'),
                          fit: BoxFit.fill))),
              Divider(
                thickness: 1.5,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildText("Electricien "),
                    styletext("| "),
                    buildText("Plumber "),
                    styletext("| "),
                    buildText("Carpenter "),
                    styletext("|"),
                    buildText(" Painter"),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Create estimates quickly",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  "assets/1.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }

  Text styletext(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w600, color: Color(0XFF8BD8BD)),
    );
  }
}
