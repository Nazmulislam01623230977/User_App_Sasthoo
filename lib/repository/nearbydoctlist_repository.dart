import 'dart:convert';

import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;
import '../models/nearbydoctor_list_model.dart';

class NearDoctorRepository {
  // ignore: missing_return
  Future<List<NearbyDoctorList>> getnearbyDoctorData() async {
    // print(speciality);
    var client = http.Client();
    try {
      await gettoken();
      var mainurl = ApiRepo.nearbydoctolist;
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
        return nearbyDoctorListFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
