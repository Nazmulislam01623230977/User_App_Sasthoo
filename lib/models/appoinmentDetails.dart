// To parse this JSON data, do
//
//     final profileonlinesheduleList = profileonlinesheduleListFromJson(jsonString);

import 'dart:convert';

ProfileonlinesheduleList profileonlinesheduleListFromJson(String str) =>
    ProfileonlinesheduleList.fromJson(json.decode(str));

String profileonlinesheduleListToJson(ProfileonlinesheduleList data) =>
    json.encode(data.toJson());

class ProfileonlinesheduleList {
  ProfileonlinesheduleList({
    this.id,
    this.doctorUserId,
    this.userId,
    this.accountId,
    this.status,
    this.paymentStatus,
    this.appoinmentId,
    this.appointmentDate,
    this.sheduleTime,
    this.problem,
    this.addPatientId,
    this.fee,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.patienPhotos,
  });

  int id;
  String doctorUserId;
  String userId;
  dynamic accountId;
  String status;
  String paymentStatus;
  String appoinmentId;
  String appointmentDate;
  String sheduleTime;
  String problem;
  dynamic addPatientId;
  String fee;
  dynamic createdAt;
  DateTime updatedAt;
  Patient patient;
  PatienPhotos patienPhotos;

  factory ProfileonlinesheduleList.fromJson(Map<String, dynamic> json) =>
      ProfileonlinesheduleList(
        id: json["id"],
        doctorUserId: json["doctor_user_id"],
        userId: json["user_id"],
        accountId: json["account_id"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        appoinmentId: json["appoinment_id"],
        appointmentDate: json["appointment_date"],
        sheduleTime: json["shedule_time"],
        problem: json["problem"],
        addPatientId: json["add_patient_id"],
        fee: json["fee"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        patient: Patient.fromJson(json["patient"]),
        patienPhotos: json["patien_photos"] == null
            ? null
            : PatienPhotos.fromJson(json["patien_photos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_user_id": doctorUserId,
        "user_id": userId,
        "account_id": accountId,
        "status": status,
        "payment_status": paymentStatus,
        "appoinment_id": appoinmentId,
        "appointment_date": appointmentDate,
        "shedule_time": sheduleTime,
        "problem": problem,
        "add_patient_id": addPatientId,
        "fee": fee,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "patient": patient.toJson(),
        "patien_photos": patienPhotos,
      };
}

class PatienPhotos {
  PatienPhotos({
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

  factory PatienPhotos.fromJson(Map<String, dynamic> json) => PatienPhotos(
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

class Patient {
  Patient({
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
  dynamic regAvater;
  dynamic about;
  String userType;
  dynamic doctorId;
  String onlineStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
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
      };
}
