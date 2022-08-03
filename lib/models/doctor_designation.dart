// To parse this JSON data, do
//
//     final doctorDesignation = doctorDesignationFromJson(jsonString);

import 'dart:convert';

DoctorDesignation doctorDesignationFromJson(String str) =>
    DoctorDesignation.fromJson(json.decode(str));

String doctorDesignationToJson(DoctorDesignation data) =>
    json.encode(data.toJson());

class DoctorDesignation {
  DoctorDesignation({
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
    this.sheduleId,
    this.onlineStatus,
    this.chamber,
    this.patientStatus,
    this.createdAt,
    this.updatedAt,
    this.doctors,
    this.doctorPhotos,
  });

  int id;
  String doctorUserId;
  String userId;
  dynamic accountId;
  String status;
  String paymentStatus;
  String appoinmentId;
  DateTime appointmentDate;
  String sheduleTime;
  String problem;
  String addPatientId;
  String fee;
  String sheduleId;
  String onlineStatus;
  dynamic chamber;
  dynamic patientStatus;
  DateTime createdAt;
  DateTime updatedAt;
  Doctors doctors;
  DoctorPhotos doctorPhotos;

  factory DoctorDesignation.fromJson(Map<String, dynamic> json) =>
      DoctorDesignation(
        id: json["id"],
        doctorUserId: json["doctor_user_id"],
        userId: json["user_id"],
        accountId: json["account_id"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        appoinmentId: json["appoinment_id"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        sheduleTime: json["shedule_time"],
        problem: json["problem"],
        addPatientId: json["add_patient_id"],
        fee: json["fee"],
        sheduleId: json["shedule_id"],
        onlineStatus: json["online_status"],
        chamber: json["chamber"],
        patientStatus: json["patient_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctors: Doctors.fromJson(json["doctors"]),
        doctorPhotos: DoctorPhotos.fromJson(json["doctor_photos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_user_id": doctorUserId,
        "user_id": userId,
        "account_id": accountId,
        "status": status,
        "payment_status": paymentStatus,
        "appoinment_id": appoinmentId,
        "appointment_date": appointmentDate.toIso8601String(),
        "shedule_time": sheduleTime,
        "problem": problem,
        "add_patient_id": addPatientId,
        "fee": fee,
        "shedule_id": sheduleId,
        "online_status": onlineStatus,
        "chamber": chamber,
        "patient_status": patientStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctors": doctors.toJson(),
        "doctor_photos": doctorPhotos.toJson(),
      };
}

class DoctorPhotos {
  DoctorPhotos({
    this.id,
    this.avater,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String avater;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory DoctorPhotos.fromJson(Map<String, dynamic> json) => DoctorPhotos(
        id: json["id"],
        avater: json["avater"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avater": avater,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Doctors {
  Doctors({
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
    this.relation,
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
  String regAvater;
  String about;
  String userType;
  dynamic doctorId;
  String onlineStatus;
  String status;
  dynamic relation;
  DateTime createdAt;
  DateTime updatedAt;

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
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
        relation: json["relation"],
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
        "relation": relation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
