import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class GetuserDataFromAPi {
  static var userinfo;
  static var userdata;
  static getuserdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userinfo = sharedPreferences.getString('userdata');
    userdata = jsonDecode(userinfo);
  }
}
