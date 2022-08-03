import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../apitoken/userinfo.dart';
import '../controller/add_patient_controller.dart';
import '../custom/custom_snackbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';
import '../models/doctor_shedule.dart';
import '../repository/doctor_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appoinmenrPreviewPage.dart';

// ignore: must_be_immutable
class ShecdulePage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var doctors;
  // ignore: prefer_typing_uninitialized_variables
  var patient;
  ShecdulePage(this.doctors, this.patient, {Key key}) : super(key: key);
  @override
  _ShecdulePageState createState() =>
      // ignore: no_logic_in_create_state
      _ShecdulePageState(doctors, patient);
}

class _ShecdulePageState extends StateMVC<ShecdulePage> {
  // ignore: prefer_typing_uninitialized_variables
  var doctors;
  // ignore: prefer_typing_uninitialized_variables
  var patient;
  AddPatientController con;
  _ShecdulePageState(this.doctors, this.patient)
      : super(AddPatientController()) {
    con = controller as AddPatientController;
  }
  TextEditingController probleamController = TextEditingController();
  TextEditingController dateController = TextEditingController();

// =============================== date time selected  ==============================
  var _online_status;
  List<Object> filesData = new List<Object>();
  bool isvisible = false;
  String doctorfreeafterpicup;
  DateTime _currentdate = DateTime.now();
  String selectbardate;
  String patientStatus;
  var initialDate = DateTime.now();
  DateTime selecDateTime;
  String selectdate;
  Future<void> _selectDate(BuildContext context) async {
    DateTime _seldate = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xff128041),
              // ignore: deprecated_member_use
              accentColor: const Color(0xff128041),
              colorScheme: const ColorScheme.light(primary: Color(0xff128041)),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(DateTime.now().year - 0, DateTime.now().month - 0,
            DateTime.now().day - 0),
        lastDate: DateTime(DateTime.now().year + 0, DateTime.now().month + 1,
            DateTime.now().day + 0));
    if (_seldate != null) {
      setState(() {
        _currentdate = _seldate;
        dateController.text =
            "${_seldate.day}/${_seldate.month}/${_seldate.year}";
        selectbardate =
            DateFormat('EEEE').format(_seldate).toUpperCase().toString();
        if (selectbardate == "শনিবার") {
          selectbardate = "SATURDAY";
        } else if (selectbardate == "রবিবার") {
          selectbardate = "SUNDAY";
        } else if (selectbardate == "সোমবার") {
          selectbardate = "MONDAY";
        } else if (selectbardate == "মঙ্গলবার") {
          selectbardate = "TUESDAY";
        } else if (selectbardate == "বুধবার") {
          selectbardate = "WEDNESDAY";
        } else if (selectbardate == "বৃহস্পতিবার") {
          selectbardate = "THURSDAY";
        } else if (selectbardate == "শুক্রবার") {
          selectbardate = "FRIDAY";
        } else {
          selectbardate =
              DateFormat('EEEE').format(_seldate).toUpperCase().toString();
        }
        selecDateTime = _seldate;
      });
    }
  }

// =================================== end date time selection =====================================
// ========================================= picup time ===========================================
  DateTime picupDateTime;
  int starttimeselectfromshedule;
  void startimeselect(var index, DateTime dateTime) async {
    setState(() {
      starttimeselectfromshedule = index;
      picupDateTime = dateTime;
    });
  }

// =========================================end picup time ===========================================
// =========================================user info Data ===========================================
  List<Doctorschedule> doctorsheduledata;
  DateTime dateforappoinment;
  var isLoaded = false;

  bool isvisibleone = false;
  List chamberlist = [];
  String _chamber;
  scheduilelistfunction() async {
    if (_online_status == "Online") {
      doctorsheduledata = await AddPatientController()
          .doctorshedule(doctors.id.toString(), _online_status, context);
      if (doctorsheduledata != null) {
        setState(() {
          isLoaded = true;
        });
      }
      if (dateController.text.isEmpty) {
        dateController.text =
            "${_currentdate.day}/${_currentdate.month}/${_currentdate.year}";
        selectbardate =
            DateFormat('EEEE').format(_currentdate).toUpperCase().toString();
      }
    } else {
      doctorsheduledata = await AddPatientController()
          .doctorshedule("0", _online_status, context);
      if (doctorsheduledata != null) {
        setState(() {
          isLoaded = true;
        });
      }
      if (dateController.text.isEmpty) {
        dateController.text =
            "${_currentdate.day}/${_currentdate.month}/${_currentdate.year}";
        selectbardate =
            DateFormat('EEEE').format(_currentdate).toUpperCase().toString();
      }
    }

    if (_online_status != "Online") {
      chamberlistfunction(doctors.id.toString(), _online_status);
    } else {
      setState(() {
        chamberlist = [];
      });
    }
  }

// =========================================end user info Data ===========================================
// ==========================
  chamberlistfunction(String id, _onlinestatus) async {
    var url = ApiRepo.chamberlist + doctors.id.toString();
    var apiurl = Uri.parse(url);
    var requestrespons = http.MultipartRequest(
      "GET",
      apiurl,
    );
    requestrespons.send().then((res) async {
      var massage = await res.stream.bytesToString();
      var jsonData = jsonDecode(massage);
      if (_onlinestatus != "Online") {
        setState(() {
          chamberlist = jsonData['result'];
        });
      } else {
        setState(() {
          chamberlist = [];
          _chamber = "Online";
        });
      }
    });
  }

  selectedchamber(String chmaber) async {
    print(chmaber);
    print(doctors.id.toString());
    doctorsheduledata = await AddPatientController()
        .doctorsheduleforchamber(doctors.id.toString(), chmaber, context);
    if (doctorsheduledata != null) {
      setState(() {
        isLoaded = true;
      });
    }

    if (dateController.text.isEmpty) {
      dateController.text =
          "${_currentdate.day}/${_currentdate.month}/${_currentdate.year}";
      selectbardate =
          DateFormat('EEEE').format(_currentdate).toUpperCase().toString();
    }
  }

// =========================================end user info Data ===========================================
  @override
  void initState() {
    GetuserDataFromAPi.getuserdata();
    userdataget();
    super.initState();
  }

  var photo;
  var avater;

  userdataget() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userdatashow = sharedPreferences.getString('userdata');
    var userdatashowdecode = jsonDecode(userdatashow);
    avater = userdatashowdecode['photo'];
    if (avater != null) {
      photo = avater['avater'].toString();
    }
    setState(() {
      userdatashowdecode = userdatashowdecode;
      photo = photo;
    });
  }

  var userAppoinmentData;
  appoinmentData() async {
    if (probleamController.text.isEmpty) {
      showCustomSnackBar('Problem filed con not empty !!', context);
    } else if (dateController.text.isEmpty) {
      showCustomSnackBar('Date filed con not empty', context);
    } else if (picupDateTime == null) {
      showCustomSnackBar('Please select time!!', context);
    } else if (doctorfreeafterpicup == null) {
      showCustomSnackBar('Please select patient type!!', context);
    } else {
      await GetuserDataFromAPi.getuserdata();

      userAppoinmentData = {
        "user_id": GetuserDataFromAPi.userdata['id'].toString(),
        "doctor_user_id": doctors.id.toString(),
        "fee": doctorfreeafterpicup,
        "appointment_date": _currentdate.toString(),
        "shedule_time": picupDateTime.toString(),
        "add_patient_id": patient.id.toString(),
        "problem": probleamController.text,
        "day": selectbardate.toLowerCase(),
        "online_status": _online_status.toString(),
        "chamber": _chamber.toString(),
        "patient_status": patientStatus.toString()
      };

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AppoinmentPreview(
                  doctors, patient, userAppoinmentData, filesData)));
    }
  }

  var savefile;
  List<PlatformFile> selectedfile;

  var filepost;
  Future<void> loadAssets() async {
    final selectedImages = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf']);
    var file = selectedImages.files;

    if (selectedfile != null) {
      setState(() {
        selectedfile += file;
      });
    } else {
      setState(() {
        selectedfile = file;
      });
    }

    for (var filereport in selectedfile) {
      filesData.add(filereport.path);
    }
  }

  removedfile(file) {
    selectedfile.remove(file);
    filesData.remove(file.path);
    setState(() {
      selectedfile = selectedfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.of(context)
            .popAndPushNamed(RouteManeger.patientappoinment_page);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset('assets/fonts/images/menu.png'));
          }),
          backgroundColor: const Color(0xff128041),
          bottomOpacity: 0.0,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Stack(
                children: const [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  Positioned(
                    left: 10,
                    child: Icon(
                      Icons.brightness_1,
                      color: Colors.red,
                      size: 9,
                    ),
                  )
                ],
              ),
              onPressed: () {
                // do something
              },
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .popAndPushNamed(RouteManeger.userprofile_page);
              },
              child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: avater != null
                      ? CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage: NetworkImage(
                            Baseurl.mainurl + "/" + photo,
                          ))
                      : const CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage: AssetImage(
                            "assets/fonts/images/logo.png",
                          ),
                        )),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).self_Name,
                          // "Name:              ",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.firstName + " " + patient.lastName,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).relationshipe,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.relationshipe,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),

                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).self_age,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.dateOfBirth,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0xFF292626),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).self_gender,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.gender,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).weight,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.weight,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          S.of(context).heigh,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        patient.height,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).self_blood,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          patient.bloodGroup,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).self_phone,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          patient.phone,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Buildprobleam(probleamController, context),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: _online_status == null
                            ? Text(
                                'Select online status*',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              )
                            : Text(
                                _online_status,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              ),
                        isExpanded: true,
                        iconSize: 25.h,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                        items: [
                          'Online',
                          'Offline',
                        ].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              this._online_status = val;
                            },
                          );
                          if (_online_status == "Offline") {
                            setState(() {
                              isvisible = true;
                            });
                          } else if (_online_status == "Online") {
                            setState(() {
                              isvisible = false;
                              _chamber = "Online";
                            });
                          }

                          scheduilelistfunction();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Visibility(
                  visible: isvisible,
                  child: Text(
                    "Select chamber",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xff000000),
                    ), //596970
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Visibility(
                  visible: isvisible,
                  child: Container(
                    height: 52.h,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF), //E9F2F2
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: _chamber == null
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  'Select your chamber',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  _chamber,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                        isExpanded: true,
                        iconSize: 25.h,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                        items: chamberlist.map(
                          (val) {
                            return DropdownMenuItem<String>(
                                child: Text(val['chamber_name']),
                                value: val['chamber_name']);
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _chamber = val;
                            },
                          );
                          selectedchamber(_chamber);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 80.h,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 23.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 13.h,
                            ),
                            Text(
                              S.of(context).self_upload,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color: const Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "JPG,JPEG,PNG,PDF",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: const Color(0xffA8A7A7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Image.asset(
                          'assets/fonts/images/picuploadbox.png',
                          height: 50.h,
                          width: 50.w,
                        ),
                        onPressed: loadAssets,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                SizedBox(
                    height: 100.h,
                    width: MediaQuery.of(context).size.width * 0.95.w,
                    child: selectedfile != null
                        ? ListView.builder(
                            itemCount: selectedfile.length,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            // ignore: missing_return
                            itemBuilder: (context, index) {
                              var uploadedfile = selectedfile[index];
                              return buildFile(uploadedfile, removedfile);
                            })
                        : const Center(
                            child: Text("No report select yet !!"),
                          )),

                // buildGridView(),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: patientStatus == null
                            ? Text(
                                'Select patient type',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              )
                            : Text(
                                patientStatus,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              ),
                        isExpanded: true,
                        iconSize: 25.h,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xff000000),
                        ),
                        items: ['New', 'Old', 'Report'].map(
                          (val) {
                            return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: const Color(0xff000000),
                                    )));
                          },
                        ).toList(),
                        onChanged: (val) async {
                          await con.doctorsfee(
                              doctors.id.toString(), val.toString());
                          setState(
                            () {
                              patientStatus = val;

                              doctorfreeafterpicup =
                                  DoctorService.doctorfrees.toString();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 52.h,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(31, 0, 0, 0),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'dd/mm/yyyy',
                                hintStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color(0xff000000),
                                ),
                                errorStyle: const TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      color: Color(0xff128041),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _selectDate(context);
                                      });
                                    })),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).self_fee,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color(0xff000000),
                          ),
                        ),
                        DoctorService.doctorfrees != null
                            ? Text(
                                DoctorService.doctorfrees.toString() + "Tk",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              )
                            : Text(
                                "0.00 Tk",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: const Color(0xff000000),
                                ),
                              )
                      ],
                    ),
                  ],
                ),

                Buildtimesloat(doctorsheduledata, selectbardate,
                    starttimeselectfromshedule, startimeselect, context),
                Padding(
                  padding:
                      EdgeInsets.only(left: 50.w, right: 50.w, bottom: 42.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.r), // <-- Radius
                        ),
                        primary: const Color(0xff128041), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () => appoinmentData(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              // 'Procceed',
                              S.of(context).patientshecdule_Procceed,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFile(PlatformFile file, removedfile) {
  final kb = file.size / 1023;
  final mb = kb / 1024;
  final fileSize =
      mb > 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toString()} Kb';

  final extension = file.extension ?? 'none';
  final Color = Colors.green;

  return InkWell(
    onTap: () => OpenFile.open(file.path),
    child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
              bottom: 0,
              right: 00,
              // left: 10,
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //   width: 4,
                  //   color:
                  //       Theme.of(context).scaffoldBackgroundColor,
                  // ),
                  // color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () => removedfile(file),
                  icon: Icon(
                    Icons.close,
                    size: 15.0,
                  ),
                  color: Colors.red,
                ),
              )),
          Expanded(
              child: Container(
                  child: Image.asset("assets/fonts/images/reportbenar.png"))),
          const SizedBox(
            height: 10,
          ),
          Text(file.name[0] +
              file.name[1] +
              file.name[2] +
              file.name[3] +
              file.name[4] +
              file.name[5]),
          // Text(
          //   fileSize,
          // )
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget Buildprobleam(probleamController, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 120.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(31, 0, 0, 0),
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(top: 8.w, left: 8.w),
          child: TextFormField(
            maxLines: 5,
            // maxLength: 1000,
            controller: probleamController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: const Color(0xff000000),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: S.of(context).self_berify,
              hintStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: const Color(0xff000000),
              ),
            ), //A7ADBC
          ),
        ),
      )
    ],
  );
}

// ignore: non_constant_identifier_names
Widget Buildtimesloat(doctorsheduledata, selectbardate,
    starttimeslectedfromshedule, startimeselected, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Text(
      //   '',
      //   // S.of(context).patientshecdule_Selectatimeslot,
      //   style: GoogleFonts.poppins(
      //     color: const Color.fromARGB(255, 7, 7, 7),
      //     fontSize: 15,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      SizedBox(
        height: 8.h,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 200.h,
            child: doctorsheduledata != null
                ? ListView.builder(
                    itemCount: doctorsheduledata.length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      var doctshedule = doctorsheduledata[index];
                      // ====================================time convert function ============================

                      List timeshedule;
                      if (selectbardate == doctshedule.day.toUpperCase()) {
                        var starttimelst =
                            jsonDecode(doctshedule.startTime).last;
                        var endtimelst = jsonDecode(doctshedule.endTime).last;

                        var timedeferrent =
                            DateTime.parse(endtimelst["value".toString()])
                                .difference(DateTime.parse(
                                    starttimelst["value".toString()]))
                                .inMinutes;

                        var totalcountforloop =
                            timedeferrent / int.parse(doctshedule.intervalTime);

                        print(totalcountforloop);
                        var startdateTime =
                            DateTime.parse(starttimelst["value".toString()]);
                        int i = 1;
                        int time = 0;
                        timeshedule = [startdateTime];
                        for (i = 1; i < totalcountforloop; i++) {
                          time += int.parse(doctshedule.intervalTime);
                          var shedule =
                              startdateTime.add(Duration(minutes: time));
                          timeshedule.add(shedule);
                        }
                      }

                      //  =========================================time convert function end ========================
                      return selectbardate == doctshedule.day.toUpperCase()
                          ? Column(
                              children: [
                                Text(
                                  doctshedule.day.toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xff128041),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Select time".toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 50.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: timeshedule.length,
                                      separatorBuilder: (context, _) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                      itemBuilder: (context, index) {
                                        var shedulestartimeforloop =
                                            timeshedule[index];
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: const Color(
                                                  0xffFFFFFF), //E9F2F2
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 6,
                                                  offset: Offset(0, 2),
                                                )
                                              ]),
                                          width: 100.w,
                                          height: 35.h,

                                          child: ElevatedButton(
                                            onPressed: () => startimeselected(
                                                index, shedulestartimeforloop),
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    starttimeslectedfromshedule ==
                                                            index
                                                        ? const Color(
                                                            0xff128041)
                                                        : Colors.grey),
                                            child: Text(
                                                DateFormat(
                                                  "h:mma",
                                                )
                                                    .format(
                                                        shedulestartimeforloop)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color:
                                                        starttimeslectedfromshedule ==
                                                                index
                                                            ? const Color(
                                                                0xffffffff)
                                                            : Colors.black)),
                                          ),

                                          // ignore: deprecated_member_use
                                          // child: OutlinedButton(
                                          //   // onPressed: () =>
                                          //   //     changeSecondaryIndex(index),
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10.0),
                                          //   ),
                                          //   borderSide: BorderSide(
                                          //       color:
                                          //           starttimeslectedfromshedule ==
                                          //                   index
                                          //               ? const Color(
                                          //                   0xff128041)
                                          //               : Colors.grey),
                                          //   onPressed: () => startimeselected(
                                          //       index, shedulestartimeforloop),
                                          //   child: Text(
                                          //       DateFormat("h:mma")
                                          //           .format(
                                          //               shedulestartimeforloop)
                                          //           .toString(),
                                          //       style: TextStyle(
                                          //           color:
                                          //               starttimeslectedfromshedule ==
                                          //                       index
                                          //                   ? const Color(
                                          //                       0xff128041)
                                          //                   : Colors.grey)),
                                          // ),
                                        );
                                      }),
                                ),
                              ],
                            )
                          : const Center();
                    })
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    ],
  );
}
