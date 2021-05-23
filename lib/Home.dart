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
  TextEditingController controller = TextEditingController();
  // final List<Map<String, dynamic>> items = [
  //   {
  //     'label': 'Plumber',
  //     'icon': Icon(Icons.plumbing),
  //   },
  //   {
  //     'label': 'Electrician',
  //     'icon': Icon(Icons.electrical_services),
  //   },
  //   {
  //     'label': 'Carpenter',
  //     'enable': false,
  //     'icon': Icon(Icons.carpenter),
  //   },
  //   {
  //     'label': 'painter',
  //     'enable': false,
  //     'icon': Icon(Icons.imagesearch_roller),
  //   },
  // ];

  static const menuItems = <String>['one', 'two', 'three'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  String _valuechoose;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: IconButton(
            //     icon: new Icon(Icons.arrow_back),
            //
            //     onPressed: () {
            //       Navigator.pop(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Otpscreen(namecontroller.text),
            //           ));
            //     }, // null disables the button
            //   ),
            // ),
            Text(
              "Registration Details",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0XFF273773),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please fill below details",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                        hintText: "Name ",
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
                    DropdownButton(
                      value: _valuechoose,

                      hint: const Text("Select Your Services"),
                      icon: Icon(Icons.arrow_drop_down),
                      // iconSize: 36,
                      // isExpanded: true,

                      onChanged: (String newValue) {
                        setState(() {
                          _valuechoose = newValue;
                        });
                      },
                      items: _dropDownMenuItems,
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: "Select Your Services",
                    //     focusColor: Colors.black,
                    //     prefix: Container(
                    //       padding: EdgeInsets.only(right: 15),
                    //       margin: EdgeInsets.only(left: 3, right: 3),
                    //       child:
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //       borderSide: BorderSide(
                    //           color: Colors.black, style: BorderStyle.solid),
                    //     ),
                    //   ),
                    // ),
                    // SelectFormField(
                    //   type: SelectFormFieldType.dropdown,
                    //   // or can be dialog
                    //   controller: controller,
                    //   labelText: 'Select your service',
                    //   items: items,
                    //   onChanged: (value) => setState(() => valuechoose = value),
                    //   onSaved: (val) => print(val),
                    // ),
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
          ],
        ),
      ),
    );
  }
}
