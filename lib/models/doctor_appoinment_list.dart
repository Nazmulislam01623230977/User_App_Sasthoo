// To parse this JSON data, do
//
//     final doctorAppoinmentForUser = doctorAppoinmentForUserFromJson(jsonString);

import 'dart:convert';

List<DoctorAppoinmentForUser> doctorAppoinmentForUserFromJson(String str) =>
    List<DoctorAppoinmentForUser>.from(
        json.decode(str).map((x) => DoctorAppoinmentForUser.fromJson(x)));

String doctorAppoinmentForUserToJson(List<DoctorAppoinmentForUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorAppoinmentForUser {
  DoctorAppoinmentForUser({
    this.id,
    this.doctorUserId,
    this.userId,
    this.accountId,
    this.status,
    this.paymentStatus,
    this.appoinmentId,
    this.appointmentDate,
    this.sheduleTime,
    this.addPatientId,
    this.fee,
    this.problem,
    this.createdAt,
    this.updatedAt,
    this.doctors,
    this.doctorPhotos,
    this.patientDetails,
    this.speciality,
    this.education,
  });

  int id;
  String doctorUserId;
  String userId;
  dynamic accountId;
  String status;
  String paymentStatus;
  String appoinmentId;
  DateTime appointmentDate;
  DateTime sheduleTime;
  String addPatientId;
  String fee;
  String problem;
  DateTime createdAt;
  DateTime updatedAt;
  Doctors doctors;
  DoctorPhotos doctorPhotos;
  PatientDetails patientDetails;

  List<Speciality> speciality;
  List<Education> education;

  factory DoctorAppoinmentForUser.fromJson(Map<String, dynamic> json) =>
      DoctorAppoinmentForUser(
        id: json["id"],
        doctorUserId: json["doctor_user_id"],
        userId: json["user_id"],
        accountId: json["account_id"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        appoinmentId: json["appoinment_id"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        sheduleTime: DateTime.parse(json["shedule_time"]),
        addPatientId:
            json["add_patient_id"] == null ? null : json["add_patient_id"],
        fee: json["fee"],
        problem: json["problem"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctors: Doctors.fromJson(json["doctors"]),
        doctorPhotos: json["doctor_photos"] == null
            ? null
            : DoctorPhotos.fromJson(json["doctor_photos"]),
        patientDetails: json["patient_details"] == null
            ? null
            : PatientDetails.fromJson(json["patient_details"]),
        speciality: List<Speciality>.from(
            json["speciality"].map((x) => Speciality.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
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
        "shedule_time": sheduleTime.toIso8601String(),
        "add_patient_id": addPatientId == null ? null : addPatientId,
        "fee": fee,
        "problem": problem,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctors": doctors.toJson(),
        "doctor_photos": doctorPhotos.toJson(),
        "patient_details":
            patientDetails == null ? null : patientDetails.toJson(),
        "speciality": List<dynamic>.from(speciality.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
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
  dynamic createdAt;
  dynamic updatedAt;

  factory DoctorPhotos.fromJson(Map<String, dynamic> json) => DoctorPhotos(
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
  String dateOfBirth;
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
        dateOfBirth: json["date_of_birth"],
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
        "date_of_birth": dateOfBirth,
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

class PatientDetails {
  PatientDetails({
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

  factory PatientDetails.fromJson(Map<String, dynamic> json) => PatientDetails(
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

class Education {
  Education({
    this.id,
    this.instituteName,
    this.examination,
    this.passingYear,
    this.grade,
    this.scale,
    this.experienceCertificate,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String instituteName;
  String examination;
  String passingYear;
  String grade;
  String scale;
  String experienceCertificate;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        instituteName: json["institute_name"],
        examination: json["examination"],
        passingYear: json["passing_year"],
        grade: json["grade"],
        scale: json["scale"],
        experienceCertificate: json["experience_certificate"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institute_name": instituteName,
        "examination": examination,
        "passing_year": passingYear,
        "grade": grade,
        "scale": scale,
        "experience_certificate": experienceCertificate,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Speciality {
  Speciality({
    this.id,
    this.specialitie,
    this.subSpecialitie,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String specialitie;
  String subSpecialitie;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
        id: json["id"],
        specialitie: json["specialitie"],
        subSpecialitie: json["sub_specialitie"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialitie": specialitie,
        "sub_specialitie": subSpecialitie,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
