// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import '../DashboadPage/dashboad.dart';
import '../Doctor/addnewpatient.dart';
import '../Doctor/appointmentdonepage.dart';
import '../Doctor/doctor_appoinment_list.dart';
import '../Doctor/doctordashboad.dart';
import '../Doctor/doctorhistory.dart';
import '../Doctor/doctorpaymentoptionpage.dart';
import '../Doctor/doctorprofile.dart';
import '../Doctor/doctorshecdulepage.dart';
import '../Doctor/information.dart';
import '../Doctor/patientAppoinment.dart';
import '../Doctor/patientedit.dart';
import '../Doctor/speciality_doctor_list.dart';
import '../LanguagePage/languagepage.dart';
import '../LogRegPage/Verification_otp.dart';
import '../LogRegPage/Verification_phone.dart';
import '../LogRegPage/forgetphnnumpage.dart';
import '../LogRegPage/forgetphnnumverfiy.dart';
import '../LogRegPage/loginpage.dart';
import '../LogRegPage/newpasswordpage.dart';
import '../LogRegPage/registrationpage.dart';
import '../LogRegPage/splashpage.dart';
import '../Translation_page/translation.dart';
import '../UserAppWeiget/seduledetailsweiget.dart';
import '../UserProfilePage/edituserprofilepage.dart';
import '../UserProfilePage/userprofile.dart';
// import '../homepage.dart';
import '../main.dart';

class RouteManeger {
  static const String loginmainpage = "/";
  static const String splashs_page = "/splashs_page";
  static const String loginin_page = "/loginin_page";
  static const String dashboad_page = "/dashboad_page";
  static const String doctordashboad_page = "/doctordashboad_page";
  static const String userprofile_page = "/userprofile_page";
  static const String doctorprofile_page = "/doctorprofile_page";
  static const String patientappoinment_page = "/patientappoinment_page";
  static const String information_page = "information_page";
  static const String paymentoption_page = "paymentoption_page";
  static const String doneAppoinment_page = "doneAppoinment_page";
  static const String doctorhistory_page = "ddoctorhistory_page";
  static const String translation_page = "translation_page";
  static const String doctorshedule_page = "doctorshedule_page";
  static const String phnver_page = "/phnver_page";
  static const String otp_page = "/otp_page";
  static const String registration_page = "/registration_page";
  static const String food_page = "/food_page";
  static const String languagepage_page = "/languagepage_page";
  static const String addpatient_page = "/addpatient_page";
  static const String editpatient_page = "/editpatient_page";
  static const String editprofilepage_page = "/editprofilepage_page";
  static const String forgetphnnumpage_page = "/forgetphnnumpage_page";
  static const String forgetotp_page = "/forgetotp_page";
  static const String forgetpassword_page = "/forgetpassword_page";
  static const String doctorappoinmentlist = "/doctor_appoinment_list";
  static const String specialitydoctorlist = "/specialitydoctorlist";
  static const String seduledatils = "/seduledatils";

  static Route<dynamic> generateroute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loginmainpage:
        return MaterialPageRoute(
          builder: (context) => LoginFunction(),
        );
      case splashs_page:
        return MaterialPageRoute(
          builder: (context) => const splash_page(),
        );
      case dashboad_page:
        return MaterialPageRoute(
          builder: (context) => const DashboadPage(),
        );
      case translation_page:
        return MaterialPageRoute(
          builder: (context) => const TransationPage(),
        );
      case doctordashboad_page:
        return MaterialPageRoute(
          builder: (context) => const DoctorDashboad(),
        );
      case userprofile_page:
        return MaterialPageRoute(
          builder: (context) => const UserProfilePage(),
        );
      case doctorprofile_page:
        return MaterialPageRoute(
          builder: (context) => DoctorProfile(args),
        );
      case patientappoinment_page:
        return MaterialPageRoute(
          builder: (context) => PatientAppoinmentPage(args),
        );
      case information_page:
        return MaterialPageRoute(
          builder: (context) => const InformationPage(),
        );
      case paymentoption_page:
        return MaterialPageRoute(
          builder: (context) => PaymentOptionPage(),
        );
      case doneAppoinment_page:
        return MaterialPageRoute(
          builder: (context) => const DoneAppoinmentPage(),
        );
      case doctorhistory_page:
        return MaterialPageRoute(
          builder: (context) => DoctorHistor(),
        );

      case doctorshedule_page:
        return MaterialPageRoute(
          builder: (context) => ShecdulePage(args, args),
        );
      case phnver_page:
        return MaterialPageRoute(
          builder: (context) => const Verification_phone(),
        );
      case loginin_page:
        return MaterialPageRoute(
          builder: (context) => const Login_Page(),
        );
      case otp_page:
        return MaterialPageRoute(
          builder: (context) => const Verification_otp(),
        );
      case registration_page:
        return MaterialPageRoute(
          builder: (context) => const RegistrationPage(),
        );
      // case food_page:
      //   return MaterialPageRoute(
      //     builder: (context) => const FoodHomePage(),
      //   );
      case languagepage_page:
        return MaterialPageRoute(
          builder: (context) => LanguagePage(),
        );
      case addpatient_page:
        return MaterialPageRoute(
          builder: (context) => AddNewPatient(args),
        );
      case editprofilepage_page:
        return MaterialPageRoute(
          builder: (context) => EditProfilePage(args),
        );
      case forgetphnnumpage_page:
        return MaterialPageRoute(
          builder: (context) => ForgetPhoneNumPage(),
        );
      case forgetotp_page:
        return MaterialPageRoute(
          builder: (context) => ForgetOtp(),
        );
      case forgetpassword_page:
        return MaterialPageRoute(
          builder: (context) => NewPassWordPage(),
        );
      case editpatient_page:
        return MaterialPageRoute(
          builder: (context) => EidtNewPatient(args, args),
        );
      case doctorappoinmentlist:
        return MaterialPageRoute(
          builder: (context) => const DoctorAppoinmentHistory(),
        );
      case seduledatils:
        return MaterialPageRoute(
          builder: (context) => SeduleDatailsWidet(args),
        );

      case specialitydoctorlist:
        return MaterialPageRoute(
          builder: (context) => SpecialityDoctorList(args),
        );
      default:
        throw const FormatException('Route not found check route again');
    }
  }
}
