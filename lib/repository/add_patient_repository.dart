import 'dart:convert';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;

import '../apitoken/userinfo.dart';

class AddPatient {
  static String msg;
  static getdoctordata(Map patientdata) async {
    var client = http.Client();
    try {
      await gettoken();
      var url = Uri.parse(ApiRepo.addpatient);
      var response = await client.post(
        url,
        body: patientdata,
        headers: headerValue,
      );
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        msg = jsonMap['status'];
      }
    } on Exception {
      msg = null;
    }
  }

  static deletePatientData(int id) async {
    var client = http.Client();
    try {
      await gettoken();
      var fromurl = ApiRepo.deletepatient + "$id";
      var url = Uri.parse(fromurl);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        msg = jsonMap['status'];
      }
    } on Exception {
      msg = null;
    }
  }

  static eidtPatientData(Map editpatiendata) async {
    var client = http.Client();
    try {
      await gettoken();
      var fromurl = ApiRepo.editpatient;
      var url = Uri.parse(fromurl);
      var response =
          await client.post(url, headers: headerValue, body: editpatiendata);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        msg = jsonMap['status'];
      }
    } on Exception {
      msg = null;
    }
  }

  static String repmsg;
  static placeAppoinment(
      Map placeAppoinmentData, List<Object> filesData) async {
    var client = http.Client();
    try {
      await gettoken();
      var fromurl = ApiRepo.placeAppoinment;
      var url = Uri.parse(fromurl);
      var response = await client.post(url,
          headers: headerValue, body: placeAppoinmentData);

      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);

        reportupload(filesData);
        repmsg = jsonMap['status'];
      }
      if (response.statusCode == 301) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        repmsg = jsonMap['status'];
      }
    } on Exception {
      repmsg = null;
    }
  }

  static reportupload(List<Object> report) async {
    await GetuserDataFromAPi.getuserdata();
    await gettoken();
    var request = http.MultipartRequest(
      "POST",
      ApiRepo.reportupload,
    );
    request.fields['user_id'] = GetuserDataFromAPi.userdata['id'].toString();
    request.headers['Content-Type'] = "multipart/form-data";
    request.headers['Accept'] = "application/json";
    request.headers['Authorization'] = 'Bearer $token';
    for (var singlereport in report) {
      request.files.add(
        await http.MultipartFile.fromPath('report[]', singlereport),
      );
    }
    request.send().then((res) async {
      // if (res.statusCode == 200) {
      //  }
      var massage = await res.stream.bytesToString();

      print(massage);
    }).catchError((e) {});
  }
}
