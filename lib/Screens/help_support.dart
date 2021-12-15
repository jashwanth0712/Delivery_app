import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:delivery_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class help_and_support extends StatefulWidget {
  const help_and_support({Key? key}) : super(key: key);

  @override
  _help_and_supportState createState() => _help_and_supportState();
}

class _help_and_supportState extends State<help_and_support> {
  @override
  final number = 6281437985;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Lottie.asset('assets/support.json', repeat: false)),
          SizedBox(
            height: 25,
          ),
          Text(
            'Welcome to Support ',
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: GestureDetector(
              onTap: () async {
                launch('tel://$number');
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.06),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.phone),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Call us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor.withOpacity(0.4),
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.navigate_next_rounded),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.06),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: " Enter your query here ",
                          hintStyle: TextStyle(color: kPrimaryLightColor.withOpacity(0.4)),
                          border: InputBorder.none,
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration:BoxDecoration(
                            color: kPrimaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0,left: 8,right: 6,bottom: 8),
                                child: Icon(Icons.send_rounded,color: Colors.white,size: 30,),
                              ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
        ],
      ),
    );
  }
}