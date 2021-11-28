import 'package:delivery_app/Screens/homePage.dart';
import 'package:delivery_app/Screens/pageManager.dart';
import 'package:delivery_app/Services/apiservices.dart';
import 'package:delivery_app/Services/authentication.dart';
import 'package:delivery_app/Services/securityServices.dart';
import 'package:delivery_app/Services/storageServices.dart';
import 'package:delivery_app/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/constants.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:delivery_app/Screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController email = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController usrname = new TextEditingController();
    TextEditingController pwd = new TextEditingController();
    return Scaffold(
      backgroundColor: Background_Color,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                width: size.width * 0.4,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Material(
                  elevation: 5,
                  shadowColor: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/title_image.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email address'),
                        TextField(
                          controller: email,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('mobile number'),
                        TextField(
                          controller: phone,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                          child: Container(
                            width: 128,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),

                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'OTP',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('username'),
                        TextField(
                          controller: usrname,
                          decoration: InputDecoration(
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Password'),
                        TextField(
                          controller: pwd,
                          obscureText: true,
                          decoration: InputDecoration(
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:16, bottom: 16),
                          child: Container(
                            width: size.width * 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                                  color: kPrimaryColor,
                                  onPressed: () async{
                                    print("SignUp button is tapped");
                                    bool isSignedIn = await Authentication().signUp(usrname.text, email.text, phone.text, pwd.text, false);
                                    print('Bool is signed in is - $isSignedIn');
                                    if(isSignedIn){
                                      Navigator.popUntil(context, (route) => false);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PageManager()));
                                    }
                                  },
                                  child: Text(
                                    "Signup",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
