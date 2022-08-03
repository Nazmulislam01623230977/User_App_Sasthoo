import 'dart:convert';

DoctorFee doctorFeeFromJson(String str) => DoctorFee.fromJson(json.decode(str));

String doctorFeeToJson(DoctorFee data) => json.encode(data.toJson());

class DoctorFee {
  DoctorFee({
    this.status,
    this.msg,
    this.data,
  });

  String status;
  List<dynamic> msg;
  String data;

  factory DoctorFee.fromJson(Map<String, dynamic> json) => DoctorFee(
        status: json["status"],
        msg: List<dynamic>.from(json["msg"].map((x) => x)),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": List<dynamic>.from(msg.map((x) => x)),
        "data": data,
      };
}
