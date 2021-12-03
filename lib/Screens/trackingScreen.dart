import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  //const TrackingPage({Key? key}) : super(key: key);
  String orderId;
  TrackingPage(this.orderId);
  @override
  _TrackingPageState createState() => _TrackingPageState(orderId);
}

class _TrackingPageState extends State<TrackingPage> {
  String orderId;
  _TrackingPageState(this.orderId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          orderId,
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}