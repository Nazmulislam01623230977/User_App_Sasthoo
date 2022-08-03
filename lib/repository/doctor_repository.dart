import 'dart:io';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import '../models/doctorlist_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorService {
  // ignore: missing_return
  static var msg;
  // ignore: missing_return
  Future<List<DoctorList>> getdoctordata() async {
    var client = http.Client();
    try {
      await gettoken();
      var url = Uri.parse(ApiRepo.doctorlist);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['result'];
        var jsondataencod = jsonEncode(jsondata);
        return doctorListFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  static var doctorfrees;
  static doctorfree(String did, patienstatus) async {
    var patienttype = patienstatus.toLowerCase();
    var client = http.Client();
    await gettoken();
    var fromurl = ApiRepo.doctorfee + did + "/" + patienttype;
    var url = Uri.parse(fromurl);
    var response = await client.get(url, headers: headerValue);
    var json = response.body;
    var doctorfree = jsonDecode(json);
    doctorfrees = doctorfree['data'];
    if (response.statusCode == 200) {}
  }
}
