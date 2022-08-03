import 'dart:convert';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;

import '../models/speciality_model.dart';

class SpecialiyRepository {
  Future<List<Specialiy>> getspecialitydata() async {
    var client = http.Client();
    try {
      await gettoken();
      var url = Uri.parse(ApiRepo.speciality);
      var response = await client.get(
        url,
        headers: headerValue,
      );
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return specialiyFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
