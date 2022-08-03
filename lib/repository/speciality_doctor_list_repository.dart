import 'dart:convert';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;

import '../models/doctorlist_models.dart';

class SpecialiyDoctorRepository {
  // ignore: missing_return
  Future<List<DoctorList>> getspecialityDoctorData(String speciality) async {
    // print(speciality);
    var client = http.Client();
    try {
      await gettoken();
      var mainurl = ApiRepo.specialitydoctorlist + speciality;
      var url = Uri.parse(mainurl);
      var response = await client.get(
        url,
        headers: headerValue,
      );
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);

        print(jsondataencod);
        return doctorListFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
