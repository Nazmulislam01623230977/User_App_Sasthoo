// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loginpage.dart';

class splash_page extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const splash_page();

  @override
  _splash_pageState createState() => _splash_pageState();
}

class _splash_pageState extends State<splash_page> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Login_Page())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: 103.w, right: 104.w, top: 423.h, bottom: 424.h),
          child: Image.asset(
            "assets/fonts/images/logo.png",
            height: 79.h,
            width: 221.w,
          ),
        ),
      ),
    );
  }
}
