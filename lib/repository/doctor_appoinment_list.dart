import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../apitoken/userinfo.dart';
import '../models/appoinmentDetails.dart';
import '../models/doctor_appoinment_list.dart';
import '../models/doctor_cancel_appoinment_list.dart';
import '../models/doctor_complatet_appoinment_list.dart';
import '../models/doctor_designation.dart';

class DoctorAppoinmentService {
  // ignore: prefer_typing_uninitialized_variables
  static var msg;
  // ignore: missing_return
  Future<List<DoctorAppoinmentForUser>> doctorAppoinmentList() async {
    await GetuserDataFromAPi.getuserdata();
    String userId = GetuserDataFromAPi.userdata['id'].toString();
    var client = http.Client();

    try {
      await gettoken();
      var mainurl = ApiRepo.doctorAppoinmentList + userId;

      var url = Uri.parse(mainurl);
      var response = await client.get(url, headers: headerValue);
      // if (response.statusCode == 200) {
      var json = response.body;
      var jsonMap = jsonDecode(json);
      var jsondata = jsonMap['data'];

      print(jsondata);
      var jsondataencod = jsonEncode(jsondata);
      return doctorAppoinmentForUserFromJson(jsondataencod);
      // }
    } on Exception {
      return null;
    }
  }

  Future<List<DoctorCancelAppoinmentForUser>>
      // ignore: missing_return
      doctorCancelAppoinmentList() async {
    await GetuserDataFromAPi.getuserdata();
    String userId = GetuserDataFromAPi.userdata['id'].toString();
    var client = http.Client();
    await gettoken();
    var mainurl = ApiRepo.doctorCancelAppoinmentList + userId;

    print(mainurl);
    try {
      var url = Uri.parse(mainurl);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return doctorCancelAppoinmentForUserFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }

  Future<List<DoctorComplatedAppoinmentForUser>>
      // ignore: missing_return
      doctorComplatedAppoinmentList() async {
    await GetuserDataFromAPi.getuserdata();
    String userId = GetuserDataFromAPi.userdata['id'].toString();
    var client = http.Client();
    try {
      await gettoken();
      var mainurl = ApiRepo.doctorComplatedAppoinmentList + userId;
      var url = Uri.parse(mainurl);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return doctorComplatedAppoinmentForUserFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }

  // ignore: missing_return
  Future<ProfileonlinesheduleList> appoinmentDetails(String id) async {
    await GetuserDataFromAPi.getuserdata();
    var client = http.Client();
    try {
      await gettoken();
      var mainurl = ApiRepo.appoinmentDetails + id;
      var url = Uri.parse(mainurl);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return profileonlinesheduleListFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
