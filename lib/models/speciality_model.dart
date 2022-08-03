import 'dart:convert';

List<Specialiy> specialiyFromJson(String str) =>
    List<Specialiy>.from(json.decode(str).map((x) => Specialiy.fromJson(x)));

String specialiyToJson(List<Specialiy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Specialiy {
  Specialiy({
    this.id,
    this.specialitie,
    this.avater,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String specialitie;
  String avater;
  DateTime createdAt;
  DateTime updatedAt;

  factory Specialiy.fromJson(Map<String, dynamic> json) => Specialiy(
        id: json["id"],
        specialitie: json["specialitie"],
        avater: json["avater"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialitie": specialitie,
        "avater": avater,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
