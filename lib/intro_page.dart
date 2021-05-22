import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plumber_app/Login.dart';

class Intropage extends StatefulWidget {
  @override
  _IntropageState createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6),
        child: AppBar(
          backgroundColor: Color(0XFF273773),
          elevation: 0,
        ),
      ),
      body: IntroductionScreen(
        pages: [
          buildPageViewModel(
              image: Image.asset(
                "assets/2.png",
              ),
              text: "Plumber",
              logo: Image.asset("assets/Logo.png"),
              heading: "Create estimates quickly",
              discription:
                  "Choose your plumbing items for your customers and create estimate & quotation in less time"),
          buildPageViewModel(
              image: Image.asset(
                "assets/3.png",
              ),
              text: "Electrician",
              logo: Image.asset("assets/Logo.png"),
              heading: "Create estimates quickly",
              discription:
                  "Choose your electrical items for your customers and create estimate & quotation in less time"),
          buildPageViewModel(
              image: Image.asset(
                "assets/4.png",
              ),
              text: "Carpenter",
              logo: Image.asset("assets/Logo.png"),
              heading: "Create estimates quickly",
              discription:
                  "Choose your carpenter items for your customers and create estimate & quotation in less time"),
          buildPageViewModel(
              image: Image.asset(
                "assets/5.png",
              ),
              text: "Painter",
              logo: Image.asset("assets/Logo.png"),
              heading: "Create estimates quickly",
              discription:
                  "Choose your carpenter items for your customers and create estimate & quotation in less time"),
        ],
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0XFF8BD8BD),
          // activeSize: Size(22.0, 10.0),
          // activeShape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        animationDuration: 2,
        done: Text("Skip"),
        showSkipButton: true,
        skip: Text("Skip"),
        onSkip: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
      ),
    );
  }

  PageViewModel buildPageViewModel(
      {Image image,
      String text,
      Image logo,
      String heading,
      String discription}) {
    return PageViewModel(
        image: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: image,
        ),
        bodyWidget: Text(discription,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13)),
        titleWidget: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color(0XFF273773),
                  fontWeight: FontWeight.bold,
                  fontSize: 33),
            ),
            Image.asset(
              "assets/Logo.png",
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              heading,
              style: TextStyle(
                fontSize: 20,
                color: Color(0XFF273773),
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
            imageFlex: 1,
            bodyFlex: 1,
            imagePadding: EdgeInsets.all(5),
            titlePadding: EdgeInsets.all(0),
            boxDecoration: BoxDecoration()));
  }
}
