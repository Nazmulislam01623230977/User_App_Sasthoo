// To parse this JSON data, do
//
//     final transcation = transcationFromJson(jsonString);

import 'dart:convert';

List<Transcation> transcationFromJson(String str) => List<Transcation>.from(
    json.decode(str).map((x) => Transcation.fromJson(x)));

String transcationToJson(List<Transcation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transcation {
  Transcation({
    this.id,
    this.doctorUserId,
    this.userId,
    this.date,
    this.reson,
    this.debit,
    this.creadit,
    this.currentBlance,
    this.tranId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  int id;
  String doctorUserId;
  String userId;
  String date;
  String reson;
  String debit;
  String creadit;
  String currentBlance;
  String tranId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Users users;

  factory Transcation.fromJson(Map<String, dynamic> json) => Transcation(
        id: json["id"],
        doctorUserId: json["doctor_user_id"],
        userId: json["user_id"],
        date: json["date"],
        reson: json["reson"],
        debit: json["debit"],
        creadit: json["creadit"],
        currentBlance: json["current_blance"],
        tranId: json["tran_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: json["users"] == null ? null : Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_user_id": doctorUserId,
        "user_id": userId,
        "date": date,
        "reson": reson,
        "debit": debit,
        "creadit": creadit,
        "current_blance": currentBlance,
        "tran_id": tranId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users.toJson(),
      };
}

class Users {
  Users({
    this.id,
    this.email,
    this.phone,
    this.token,
    this.userGenId,
    this.emailVerifiedAt,
    this.title,
    this.firstName,
    this.lastName,
    this.gender,
    this.nid,
    this.passport,
    this.dateOfBirth,
    this.bloodGroup,
    this.bmdcNo,
    this.regAvater,
    this.about,
    this.userType,
    this.doctorId,
    this.onlineStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.useravater,
  });

  int id;
  String email;
  String phone;
  String token;
  String userGenId;
  dynamic emailVerifiedAt;
  String title;
  String firstName;
  String lastName;
  String gender;
  String nid;
  String passport;
  DateTime dateOfBirth;
  String bloodGroup;
  String bmdcNo;
  String regAvater;
  dynamic about;
  String userType;
  dynamic doctorId;
  String onlineStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Useravater useravater;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        token: json["token"],
        userGenId: json["user_gen_id"],
        emailVerifiedAt: json["email_verified_at"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        nid: json["nid"],
        passport: json["passport"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        bloodGroup: json["blood_group"],
        bmdcNo: json["bmdc_no"],
        regAvater: json["reg_avater"],
        about: json["about"],
        userType: json["user_type"],
        doctorId: json["doctor_id"],
        onlineStatus: json["online_status"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        useravater: json["useravater"] == null
            ? null
            : Useravater.fromJson(json["useravater"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "token": token,
        "user_gen_id": userGenId,
        "email_verified_at": emailVerifiedAt,
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "nid": nid,
        "passport": passport,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "blood_group": bloodGroup,
        "bmdc_no": bmdcNo,
        "reg_avater": regAvater,
        "about": about,
        "user_type": userType,
        "doctor_id": doctorId,
        "online_status": onlineStatus,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "useravater": useravater.toJson(),
      };
}

class Useravater {
  Useravater({
    this.id,
    this.avater,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String avater;
  String userId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Useravater.fromJson(Map<String, dynamic> json) => Useravater(
        id: json["id"],
        avater: json["avater"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avater": avater,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
