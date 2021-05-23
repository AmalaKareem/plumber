import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:plumber_app/Home.dart';

class Otpscreen extends StatefulWidget {
  final String phone;
  Otpscreen(this.phone);

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  String errorMessage = '';
  String otp;
  FirebaseAuth auth = FirebaseAuth.instance;

  String Verificationcode;

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color.fromRGBO(252, 252, 252, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  verifyPhone() async {
    print('_OtpscreenState.verifyPhone');
    FirebaseAuth.instance.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: "+91${widget.phone}",
        verificationCompleted: (AuthCredential authCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value) async {
            if (value.user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alert Dialog"),
                      content: Text('Error'),
                    );
                  });
            }
          });
        },
        // (PhoneAuthCredential credential) async {
        //   await FirebaseAuth.instance
        //       .signInWithCredential(credential)
        //       .then((value) async {
        //     if (value.user != null) {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Home()),
        //       );
        //     }
        //   });
        // },

        verificationFailed: (FirebaseAuthException authException) {
          setState(() {
            Verificationcode = "Authentication failed";
          });
          print("failed");
        },
        // (FirebaseAuthException error) {
        //   print(error.message);
        // },appopen chyy
        codeSent: (String verificationID, int resendToken) {
          print('oncoddesent');
          setState(() {
            Verificationcode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            Verificationcode = verificationID;
          });
        });
  }

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => verifyPhone());
    // verifyPhone();
  }

  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();

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
            Container(
              alignment: Alignment.topLeft,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
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
            Align(
              alignment: Alignment.center,
              child: Text("Create estimates quickly",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                  child: Text(
                "Verify +91- ${widget.phone}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: PinPut(
                fieldsCount: 6,
                withCursor: true,
                textStyle:
                    const TextStyle(fontSize: 25.0, color: Colors.black87),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                // onSubmit: (pin) async {
                //
                // },
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: Verificationcode,
                          smsCode: _pinPutController.text))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alert Dialog"),
                              content: Text('Error'),
                            );
                          });
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  Scaffoldkey.currentState.showSnackBar((SnackBar(
                    content: Text("Invalid OTP "),
                  )));
                }
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Home()));

                // }
                // (pin) async {
                //   await FirebaseAuth.instance
                //       .signInWithCredential(PhoneAuthProvider.credential(
                //           verificationId: Verificationcode, smsCode: pin))
                //       .then((value) {
                //     if (value.user != null) {
                //       print("nothing");
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => Home()),
                //       );
                //     }
                //   });
                // };
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
            SizedBox(
              height: 4,
            ),
            InkWell(
              child: Text(
                "Resend Code ?",
                style: TextStyle(
                    color: Color(0XFF273773),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                verifyPhone();
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Home()));
              },
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
