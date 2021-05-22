import 'dart:ui';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:plumber_app/autocomplete.dart';

class UserScreen extends StatefulWidget {
  final String name;

  UserScreen({Key key, this.name}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  TextEditingController tool = TextEditingController();
  // AutoCompleteTextField searchTextField;

  List<String> tools = [
    "DUTRON  INDIA",
    "APOLLO PIPES",
    "ASTRAL PIPES",
    "FINOLEX INDUSTRIES"
        "KOHLER INDIA",
    "JINDAL",
    "TATA",
    "PRINCE",
    "ASHIRVAD",
    "TOTO",
    "JOHNSON",
    "JAQUAR",
    "CERA",
    "HINDWARE",
    "PARRYWARE",
    "BOSCH",
    "DEWALT",
    "HITACHI",
    "DONCHENG",
    "CUMI",
    "FERM",
    "BLACK & DECKER",
    " KPT"
  ];

  FloatingActionButtonLocation floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 500.0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome  ${widget.name}",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.0),
          ),
          backgroundColor: Colors.tealAccent.shade700,
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Container(
          height: double.infinity,
          width: double.infinity,

          // decoration: BoxDecoration(
          //   image: DecorationImage(
          // image: AssetImage("assets/orange.png"),
          // fit: BoxFit.cover,
          // ),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "List of Companies",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Image.asset(
                      "assets/build.png",
                      height: 130,
                    ),
                  ],
                ),

                SizedBox(
                  height: 3,
                ),
                // searchTextField =
                Container(
                  height: 50,
                  child: AutoCompleteTextField(
                    clearOnSubmit: false,
                    itemFilter: (item, query) =>
                        item.toUpperCase().startsWith(query.toUpperCase()),
                    itemSorter: (a, b) => a.compareTo(b),
                    itemSubmitted: (item) => tool.text = item,
                    itemBuilder: (context, item
                        // ignore: missing_return, missing_return, missing_return
                        ) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(item, style: TextStyle(color: Colors.black87))
                          ],
                        ),
                      );
                    },
                    suggestions: tools,
                    controller: tool,
                    style: new TextStyle(color: Colors.black87, fontSize: 14.0),
                    decoration: new InputDecoration(
                      hintText: "Search",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          if (tool.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Data()),
                            );
                          }
                        },
                      ),
                      suffix: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            tool.clear();
                          }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Image.asset("assets/tool.png"),
                SizedBox(
                  height: 445,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: tools.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Data(
                                        compnyName: tools[index],
                                      )),
                            );
                          },
                          child: Card(
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Container(
                              // height: 90,
                              width: double.infinity,
                              margin: EdgeInsets.all(10),
                              color: Colors.teal,
                              // decorationa: BoxDecoration(
                              //     borderRadius: BorderRadius.circular()),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/doll.png",
                                        height: 50,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            tools[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      " 'we dont believe in taking right decisions. We take decisions and make them right.'",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0XFFecf9f4)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
