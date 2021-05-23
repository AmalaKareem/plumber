import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plumber_app/Login.dart';
import 'package:plumber_app/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
            color: Colors.white,
          )),
          primarySwatch: Helper.bgColour,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.red,
          canvasColor: Colors.white),
      home: Login(),
    );
  }
}
