import 'package:flutter/material.dart';

class VideocallingPage extends StatefulWidget {
  @override
  _VideocallingPageState createState() => _VideocallingPageState();
}

class _VideocallingPageState extends State<VideocallingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/videocall.png"),
              fit: BoxFit.cover,
            ),
          ),
          // child: null /* add child content here */,
        ),
      ),
    );
  }
}
