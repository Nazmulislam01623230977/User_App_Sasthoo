// To parse this JSON data, do
//
//     final patienList = patienListFromJson(jsonString);

import 'dart:convert';

List<PatienList> patienListFromJson(String str) =>
    List<PatienList>.from(json.decode(str).map((x) => PatienList.fromJson(x)));

String patienListToJson(List<PatienList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatienList {
  PatienList({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.weight,
    this.height,
    this.phone,
    this.relationshipe,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String bloodGroup;
  String weight;
  String height;
  String phone;
  String relationshipe;
  DateTime createdAt;
  DateTime updatedAt;

  factory PatienList.fromJson(Map<String, dynamic> json) => PatienList(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        bloodGroup: json["blood_group"],
        weight: json["weight"],
        height: json["height"],
        phone: json["phone"],
        relationshipe: json["relationshipe"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "blood_group": bloodGroup,
        "weight": weight,
        "height": height,
        "phone": phone,
        "relationshipe": relationshipe,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
