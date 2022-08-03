import 'package:digital_sasthoo_user/body/add_patient_body.dart';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../apitoken/userinfo.dart';
import '../models/patient_list_models.dart';

class PatientService {
  // ignore: missing_return
  Future<List<PatienList>> getPatientData() async {
    await GetuserDataFromAPi.getuserdata();
    var userId = GetuserDataFromAPi.userdata['id'];
    var client = http.Client();
    try {
      await gettoken();

      var fromurl = ApiRepo.patientList + "$userId";
      var url = Uri.parse(fromurl);
      var response = await client.get(url, headers: headerValue);
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return patienListFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
