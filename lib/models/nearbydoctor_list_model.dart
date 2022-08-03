// To parse this JSON data, do
//
//     final doctorList = doctorListFromJson(jsonString);

import 'dart:convert';

List<NearbyDoctorList> nearbyDoctorListFromJson(String str) =>
    List<NearbyDoctorList>.from(
        json.decode(str).map((x) => NearbyDoctorList.fromJson(x)));

String doctorListToJson(List<NearbyDoctorList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearbyDoctorList {
  NearbyDoctorList({
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
    this.chambers,
    this.reviewusers,
    this.userPhotos,
    this.doctorSpeciality,
    this.educationExpriance,
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
  List<Chamber> chambers;
  List<dynamic> reviewusers;
  List<UserPhoto> userPhotos;
  List<DoctorSpeciality> doctorSpeciality;
  List<EducationExpriance> educationExpriance;

  factory NearbyDoctorList.fromJson(Map<String, dynamic> json) =>
      NearbyDoctorList(
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
        chambers: List<Chamber>.from(
            json["chambers"].map((x) => Chamber.fromJson(x))),
        reviewusers: List<dynamic>.from(json["reviewusers"].map((x) => x)),
        userPhotos: List<UserPhoto>.from(
            json["user_photos"].map((x) => UserPhoto.fromJson(x))),
        doctorSpeciality: List<DoctorSpeciality>.from(
            json["doctor_speciality"].map((x) => DoctorSpeciality.fromJson(x))),
        educationExpriance: List<EducationExpriance>.from(
            json["education_expriance"]
                .map((x) => EducationExpriance.fromJson(x))),
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
        "chambers": List<dynamic>.from(chambers.map((x) => x.toJson())),
        "reviewusers": List<dynamic>.from(reviewusers.map((x) => x)),
        "user_photos": List<dynamic>.from(userPhotos.map((x) => x.toJson())),
        "doctor_speciality":
            List<dynamic>.from(doctorSpeciality.map((x) => x.toJson())),
        "education_expriance":
            List<dynamic>.from(educationExpriance.map((x) => x.toJson())),
      };
}

class Chamber {
  Chamber({
    this.id,
    this.chamberName,
    this.description,
    this.address,
    this.lat,
    this.lng,
    this.avater,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.schedules,
  });

  int id;
  String chamberName;
  String description;
  String address;
  dynamic lat;
  dynamic lng;
  dynamic avater;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Schedule> schedules;

  factory Chamber.fromJson(Map<String, dynamic> json) => Chamber(
        id: json["id"],
        chamberName: json["chamber_name"],
        description: json["description"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        avater: json["avater"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        schedules: List<Schedule>.from(
            json["schedules"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chamber_name": chamberName,
        "description": description,
        "address": address,
        "lat": lat,
        "lng": lng,
        "avater": avater,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
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
    this.doctorfees,
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
  List<Doctorfee> doctorfees;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
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
        doctorfees: List<Doctorfee>.from(
            json["doctorfees"].map((x) => Doctorfee.fromJson(x))),
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
        "doctorfees": List<dynamic>.from(doctorfees.map((x) => x.toJson())),
      };
}

class Doctorfee {
  Doctorfee({
    this.id,
    this.userId,
    this.schedulId,
    this.onlineStatus,
    this.oldPatientFree,
    this.newPatientFree,
    this.reportPatientFree,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String schedulId;
  String onlineStatus;
  String oldPatientFree;
  String newPatientFree;
  String reportPatientFree;
  DateTime createdAt;
  DateTime updatedAt;

  factory Doctorfee.fromJson(Map<String, dynamic> json) => Doctorfee(
        id: json["id"],
        userId: json["user_id"],
        schedulId: json["schedul_id"],
        onlineStatus: json["online_status"],
        oldPatientFree: json["old_patient_free"],
        newPatientFree: json["new_patient_free"],
        reportPatientFree: json["report_patient_free"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "schedul_id": schedulId,
        "online_status": onlineStatus,
        "old_patient_free": oldPatientFree,
        "new_patient_free": newPatientFree,
        "report_patient_free": reportPatientFree,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class DoctorSpeciality {
  DoctorSpeciality({
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

  factory DoctorSpeciality.fromJson(Map<String, dynamic> json) =>
      DoctorSpeciality(
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

class EducationExpriance {
  EducationExpriance({
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

  factory EducationExpriance.fromJson(Map<String, dynamic> json) =>
      EducationExpriance(
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

class UserPhoto {
  UserPhoto({
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

  factory UserPhoto.fromJson(Map<String, dynamic> json) => UserPhoto(
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
