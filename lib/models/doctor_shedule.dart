import 'dart:convert';

List<Doctorschedule> doctorscheduleFromJson(String str) =>
    List<Doctorschedule>.from(
        json.decode(str).map((x) => Doctorschedule.fromJson(x)));

String doctorscheduleToJson(List<Doctorschedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctorschedule {
  Doctorschedule({
    this.id,
    this.userId,
    this.chamberId,
    this.day,
    this.startTime,
    this.endTime,
    this.patientLimit,
    this.intervalTime,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String chamberId;
  String day;
  String startTime;
  String endTime;
  String patientLimit;
  String intervalTime;
  DateTime createdAt;
  DateTime updatedAt;

  factory Doctorschedule.fromJson(Map<String, dynamic> json) => Doctorschedule(
        id: json["id"],
        userId: json["user_id"],
        chamberId: json["chamber_id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        patientLimit: json["patient_limit"],
        intervalTime: json["interval_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "chamber_id": chamberId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "patient_limit": patientLimit,
        "interval_time": intervalTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
