import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
var token;
gettoken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString('token');
}

final headerValue = {
  'Accept': 'application/json',
  'Authorization': 'Bearer $token',
};
