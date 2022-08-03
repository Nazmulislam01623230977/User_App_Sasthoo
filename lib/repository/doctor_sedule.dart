import '../apitoken/userinfo.dart';
import '../models/doctor_shedule.dart';
import 'dart:convert';
import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import 'package:http/http.dart' as http;

class DoctorBookingService {
  // ignore: missing_return
  static Future<List<Doctorschedule>> getsheduledata(
      userid, onlinestatu) async {
    ;
    var client = http.Client();
    try {
      await gettoken();
      var fromurl = ApiRepo.doctorshedule + "/" + "$userid" + "/" + onlinestatu;
      var url = Uri.parse(fromurl);
      var response = await client.get(url, headers: headerValue);

      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['data'];
        var jsondataencod = jsonEncode(jsondata);
        return doctorscheduleFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }

  // ignore: missing_return
  static Future<List<Doctorschedule>> getsheduledatachamber(
      userid, chamber) async {
    var client = http.Client();
    try {
      await gettoken();
      var fromurl =
          ApiRepo.schedulistforfreeoflinechamber + "$userid" + "/" + "$chamber";
      var url = Uri.parse(fromurl);
      var response = await client.get(url, headers: headerValue);

      if (response.statusCode == 200) {
        var json = response.body;
        var jsonMap = jsonDecode(json);
        var jsondata = jsonMap['result'];
        var jsondataencod = jsonEncode(jsondata);
        return doctorscheduleFromJson(jsondataencod);
      }
    } on Exception {
      return null;
    }
  }
}
