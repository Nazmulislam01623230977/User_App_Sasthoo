import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../apitoken/userinfo.dart';
import '../controller/add_patient_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelfAppoinPreview extends StatefulWidget {
  @override
  var doctors;
  var patients;
  var userAppoinmentData;
  var filesData;

  SelfAppoinPreview(
      this.doctors, this.patients, this.userAppoinmentData, this.filesData,
      {Key key})
      : super(key: key);
  @override
  _SelfAppoinPreviewState createState() => _SelfAppoinPreviewState(
      this.doctors, this.patients, this.userAppoinmentData, filesData);
}

class _SelfAppoinPreviewState extends StateMVC<SelfAppoinPreview> {
  var doctors;
  var patients;
  var userAppoinmentData;
  var filesData;
  AddPatientController con;
  _SelfAppoinPreviewState(
      this.doctors, this.patients, this.userAppoinmentData, this.filesData)
      : super(AddPatientController()) {
    con = controller as AddPatientController;
  }

  @override
  void initState() {
    GetuserDataFromAPi.getuserdata();
    userdataget();
    super.initState();
  }

  makeappoinment() async {
    con.placeAppoinmentself(
        userAppoinmentData, doctors, patients, filesData, context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: Text(
                'Patient Information',
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: Container(
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
                  height: 220.h,
                  width: 388.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Name      :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 240.w,
                              child: Text(
                                GetuserDataFromAPi.userdata['first_name']
                                        .toString() +
                                    " " +
                                    GetuserDataFromAPi.userdata['last_name']
                                        .toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Mobile    :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                GetuserDataFromAPi.userdata['phone'].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Age         :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 270.w,
                              child: Text(
                                "${AgeCalculator.age(DateTime.parse(GetuserDataFromAPi.userdata['date_of_birth'].toString()))}",
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Reason   :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 270.w,
                              child: Text(
                                userAppoinmentData['problem'].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Doctor Information',
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: Container(
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
                  height: 220.h,
                  width: 388.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Name           :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 190.w,
                              child: Text(
                                doctors.title +
                                    " " +
                                    doctors.firstName +
                                    " " +
                                    doctors.lastName,
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Mobile         :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 190.w,
                              child: Text(
                                doctors.phone,
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Appoit time :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                DateFormat(
                                  "h:mma",
                                ).format(DateTime.parse(
                                    "${userAppoinmentData['shedule_time']}")),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Appoit Date :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                DateFormat.MMMEd().format(DateTime.parse(
                                    "${userAppoinmentData['appointment_date']}")),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: const Divider(
                          color: Color.fromARGB(137, 199, 193, 193),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Chamber      :',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 220.w,
                                child: userAppoinmentData['chamber'] != null
                                    ? Text(
                                        userAppoinmentData['chamber'],
                                        style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : Text(
                                        "Online Chamber",
                                        style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Payment Information',
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: Container(
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
                  height: 80.h,
                  width: 388.w,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 20),
                          child: Table(
                            // border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 30.h,
                                  child: Text(
                                    "Purpuse",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 120.w,
                                    height: 30.h,
                                    child: Text(
                                      userAppoinmentData['online_status'],
                                      style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 30.h,
                                  child: Text(
                                    "Amount",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 120.w,
                                    height: 30.h,
                                    child: Text(
                                      userAppoinmentData['fee'] + " Tk",
                                      style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ])
                            ],
                          ),
                        ),
                      ])),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 42.h),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r), // <-- Radius
                    ),
                    primary: const Color(0xff128041), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => makeappoinment(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Confirm',
                          // " S.of(context).patientshecdule_Procceed,",
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
    );
  }
}
