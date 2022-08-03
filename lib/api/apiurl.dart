class Baseurl {
  static var mainurl = "https://digitalshasthoo.reflexit.com.bd";
}

class ApiRepo {
  static var phoneurl = Uri.parse(
      Baseurl.mainurl + "/api/mobile_apps_user/mobile-apps-user-otp-send");
  static var otpverify = Uri.parse(
      Baseurl.mainurl + "/api/mobile_apps_user/mobile-apps-user-otp-verify");
  static var regverify = Uri.parse(
      Baseurl.mainurl + "/api/mobile_apps_user/mobile-apps-user-registration");
  static var loginurl =
      Uri.parse(Baseurl.mainurl + "/api/mobile_apps_user/userlogin");
  static var reportupload =
      Uri.parse(Baseurl.mainurl + "/api/users_apps/reportupload");

  static var appoinmentDetails =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/appoinmentdetails/";

  static var recievedPhoto = Uri.parse(
      Baseurl.mainurl + "/api/mobile_apps_user_profile/userregphotupdate");
  static var userdata =
      Uri.parse(Baseurl.mainurl + "/api/mobile_apps_user_profile/getuserdata");
  static var profileeditdata =
      Uri.parse(Baseurl.mainurl + "/api/mobile_apps_user_profile/profile-edit");
  static var schedulistforfree =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/schedulelistforfee/";
  static var doctorlist = Baseurl.mainurl + "/api/users_apps/doctor_list";

  static var workingexperence = Uri.parse(Baseurl.mainurl +
      "/api/mobile_apps_user_profile/working-experiences-save");
  static var workingexpurl =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/workingexperiences/";
  static var educationexpurl =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/educationexperiences/";
  static var chamberlist =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/chamberlist/";
  static var doctordesignature =
      Baseurl.mainurl + "/api/users_apps/doctordesignation/";
  static var schedulistforfreechamber =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/shedilueforchamber/";
  static var schedulistforfreeoflinechamber = Baseurl.mainurl +
      "/api/mobile_apps_user_profile/shedilueforchamberselfsedule/";
  static var chmbersetup =
      Uri.parse(Baseurl.mainurl + "/api/mobile_apps_user_profile/chambersetup");
  static var chamberdelete =
      Baseurl.mainurl + "/api/mobile_apps_user_profile/chamberdelete/";
  static var chmberedit =
      Uri.parse(Baseurl.mainurl + "/api/mobile_apps_user_profile/chamberedit");
  static var educationsave = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/education_experiences-save");
  static var educationupdate = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/education_experiences-update");
  static var educationdelete = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/education_experiences-delete");
  static var workingsave = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/working-experiences-save");
  static var workingupdate = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/working-experiences-update");
  static var workingdelete = Uri.parse("${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/working-experiences-delete");
  static var uphotoupload = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/userphotoupdate");
  static var walletsetup = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/waletessetup");
  static var walletlist =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/waleteslist/";
  static var walletedit = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/waleteedit");
  static var walletdelete =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/waletesdelete/";
  static var staffsetup = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/stafsave");
  static var stafflist =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/staflist/";
  static var stafedit = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/stafedit");
  static var staffdelete =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/stafdelet/";
  static var doctorfeesetup = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/doctorfreesetup");
  static var schedulesetup = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/schedulesetup");
  // ==============================================================================
  static var patientList = Baseurl.mainurl + "/api/users_apps/patientlist/";
  static var addpatient = Baseurl.mainurl + "/api/users_apps/addpatient";
  static var deletepatient = Baseurl.mainurl + "/api/users_apps/patientdelete/";
  static var editpatient = Baseurl.mainurl + "/api/users_apps/patientupdate";

  static var doctorshedule =
      Baseurl.mainurl + "/api/users_apps/shediuleforappoinment";
  static var doctorfee =
      Baseurl.mainurl + "/api/users_apps/doctorfreeoldandnew/";

  static var placeAppoinment =
      Baseurl.mainurl + "/api/users_apps/placeappoinment";

  static var doctorAppoinmentList =
      Baseurl.mainurl + "/api/users_apps/doctorappoinmentlist/";

  static var doctorCancelAppoinmentList =
      Baseurl.mainurl + "/api/users_apps/doctorcancleappoinmentlist/";

  static var doctorComplatedAppoinmentList =
      Baseurl.mainurl + "/api/users_apps/doctorcampletedappoinmentlist/";
  static var speciality =
      Baseurl.mainurl + "/api/users_apps/specialityfordoctor";

  static var specialitydoctorlist =
      Baseurl.mainurl + "/api/users_apps/specialitydoctor/";
  static var nearbydoctolist =
      Baseurl.mainurl + "/api/users_apps/nearbydoctorslist";
  // ==============================================================================

  static var feesdelete =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/doctorfreesdelete/";
  static var familylist =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/famillylist/";
  static var familysetup = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/famillysetup");
  static var familylistadd = "${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/famillylistafteradd/";
  static var familydelete =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/famillylistdelete/";
  static var shedulelist =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/schedulelist/";
  static var appoinmentlist = "${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/doctorappoinmentlist/";
  static var forgetphonenum = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user/forgetpasswordphone");
  static var forgetotpnum =
      Uri.parse("${Baseurl.mainurl}" + "/api/mobile_apps_user/forgetotpverify");
  static var changepassword =
      Uri.parse("${Baseurl.mainurl}" + "/api/mobile_apps_user/newpassword");
  static var spceil =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user/specialitys";
  static var subspceil =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user/subspecialitys/";
  static var specialtsave = Uri.parse(
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/specialitysave");
  static var speciallist =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/specialitylist/";
  static var specialistdelete =
      "${Baseurl.mainurl}" + "/api/mobile_apps_user_profile/specialitydelete/";

  static var onlineprofileshedulelist = "${Baseurl.mainurl}" +
      "/api/mobile_apps_user_profile/profileonlineshedule/";
}
