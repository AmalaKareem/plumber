import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plumber_app/Otp_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller = TextEditingController();

  bool validate = false;

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/Logo.png"),
              )),
            ),
            Container(
              padding: EdgeInsets.only(top: 2),
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
            Align(
              alignment: Alignment.center,
              child: Text("Create estimates quickly",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Enter your number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 14),
              child: IntlPhoneField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 10, height: 0.1),
                  contentPadding: EdgeInsets.all(8),
                  // border: new OutlineInputBorder(
                  //   borderSide: new BorderSide(color: Colors.black),
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  counterText: "",
                  hintText: "Your phone number",
                  // helperText: validate ? 'Phone number Can\'t Be Empty' : null,
                  errorText: validate ? 'Phone number Can\'t Be Empty' : null,
                ),

                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
                initialCountryCode: 'IN', //default contry code, NP for Nepal
                onChanged: (phone) {
                  //when phone number country code is changed
                  print(phone.completeNumber); //get complete number
                  print(phone.countryCode); // get country code only
                  print(phone.number); // only phone number
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: RaisedButton(
                shape: StadiumBorder(),
                onPressed: () {
                  setState(() {
                    _controller.text.isEmpty
                        ? validate = true
                        : validate = false;
                  });
                  if (_controller.text.isNotEmpty &&
                      _controller.text.length == 10)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Otpscreen(_controller.text)),
                    );
                },
                color: Color(0XFF8BD8BD),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: Color(0XFF273773),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text styletext(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text buildText(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0XFF8BD8BD),
        ));
  }
}
