import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    final String phone = FirebaseAuth.instance.currentUser.phoneNumber;
    print(phone);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text(
          "CART ITEMS",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        height: 1000,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 150,
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 400,
                  child: ListTile(
                    tileColor: Colors.teal,
                    title: SizedBox(
                      height: 50,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("1"),
                            Container(
                              width: 60,
                              height: 300,
                              child: Image.network(
                                  "https://toolsindia.in/wp-content/uploads/2020/04/BALL-POINT-ALLEN-KEY-SET-EXTRA-LONG-PATTERN-280x280.jpg"),
                            ),
                            Text("ALLEN KEY"),
                            Text("Quantity :"),
                            Text("- 1 +"),
                            SizedBox(
                              width: 2,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("Total Price:₹20"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            RaisedButton(
              onPressed: () async {
                await launch(
                    "https://wa.me/$phone/?text=1. ALLEN KEY   Quantity:  1   TotalPrice: ₹20 ");
              },
              color: Colors.teal,
              child: Text(
                "Proceed To Buy ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
