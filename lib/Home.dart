import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plumber_app/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String amala = "";

class _HomeState extends State<Home> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController(text: amala);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: namecontroller,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is empty";
                    } else if (value.length < 2) {
                      return "name must be more than 3 letters";
                    }
                    // ignore: missing_return
                    print(namecontroller.text);
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    hintText: "Name of the user",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Location  is empty";
                    } else if (value.length < 2) {
                      return "name must be more than 3 letters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    hintText: "Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "pincode  is empty";
                    } else if (value.length < 2) {
                      return "name must be more than 3 letters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    hintText: " Pincode",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(height: 9),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Address  is empty";
                    } else if (value.length < 2) {
                      return "name must be more than 3 letters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Email  is empty";
                    } else if (value.length < 2) {
                      return "name must be more than 3 letters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () async {
                      amala = "house";
                      if (formkey.currentState.validate()) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('token', true);
                        prefs.setString('name', namecontroller.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserScreen(
                                    name: namecontroller.text,
                                  )),
                        );
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
