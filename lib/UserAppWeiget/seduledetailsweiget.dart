import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../controller/appoinment_controller.dart';
import '../models/appoinmentDetails.dart';
import '../models/doctor_appoinment_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../prescriptionDownload.dart';
import '../videocall_page.dart';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SeduleDatailsWidet extends StatefulWidget {
  DoctorAppoinmentForUser pandingDotorAppoinment;

  SeduleDatailsWidet(this.pandingDotorAppoinment, {Key key}) : super(key: key);
  @override
  _SeduleDatailsWidetState createState() =>
      _SeduleDatailsWidetState(this.pandingDotorAppoinment);
}

class _SeduleDatailsWidetState extends State<SeduleDatailsWidet> {
  var pandingDotorAppoinment;

  _SeduleDatailsWidetState(this.pandingDotorAppoinment);

  ProfileonlinesheduleList appoinmentdetails;
  var isLoaded = false;

  var userdatashowdecode;
  var userdatashow;
  var photo;
  var avater;

  var date = DateFormat.MMMMEEEEd().format(DateTime.now());
  userdataget() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userdatashow = sharedPreferences.getString('userdata');
    userdatashowdecode = jsonDecode(userdatashow);
    avater = userdatashowdecode['photo'];
    if (avater != null) {
      photo = avater['avater'].toString();
    }
    setState(() {
      userdatashowdecode = userdatashowdecode;
      photo = photo;
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var imagepic;

  patientAppoinmentDetails() async {
    await userdataget();
    appoinmentdetails = await AppoinmentController()
        .appoinmentDetails(pandingDotorAppoinment.id.toString());
    if (appoinmentdetails != null) {
      setState(() {
        isLoaded = true;
        imagepic = appoinmentdetails.patienPhotos;
      });
    }
    print(pandingDotorAppoinment.id);
  }

  void initState() {
    super.initState();
    patientAppoinmentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Text(
                'Appoinment Details',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
              child: Divider(
                color: Colors.black,
                thickness: 1.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (pandingDotorAppoinment.doctorPhotos != null)
                    imagepic != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.network(
                              Baseurl.mainurl +
                                  "/" +
                                  pandingDotorAppoinment.doctorPhotos.avater,
                              height: 100.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset(
                              "assets/fonts/images/noimage.png",
                              height: 100.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: appoinmentdetails != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pandingDotorAppoinment.doctors.title +
                                    " " +
                                    pandingDotorAppoinment.doctors.firstName +
                                    " " +
                                    pandingDotorAppoinment.doctors.lastName,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000)),
                              ),

                              SizedBox(
                                  width: 400,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 5.h),
                                    child: pandingDotorAppoinment.education !=
                                            null
                                        ? ListView.builder(
                                            itemCount: pandingDotorAppoinment
                                                .education.length,
                                            scrollDirection: Axis.vertical,
                                            physics: const ScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              var education =
                                                  pandingDotorAppoinment
                                                      .education[index];
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        education.examination,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 12.sp,
                                                          color: const Color(
                                                              0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  )),

                              SizedBox(
                                  width: 400,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 5.h),
                                    child: pandingDotorAppoinment.speciality !=
                                            null
                                        ? ListView.builder(
                                            itemCount: pandingDotorAppoinment
                                                .speciality.length,
                                            scrollDirection: Axis.vertical,
                                            physics: const ScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              var speciality =
                                                  pandingDotorAppoinment
                                                      .speciality[index];
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        speciality.specialitie,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 12.sp,
                                                          color: const Color(
                                                              0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  )),
                              // Row(
                              //   children: [
                              //     Text(
                              //       'Reason: ',
                              //       style: GoogleFonts.poppins(
                              //           fontSize: 12.sp,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff000000)),
                              //     ),
                              //     Text(
                              //       pandingDotorAppoinment.problem,
                              //       style: GoogleFonts.poppins(
                              //           fontSize: 12.sp,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff000000)),
                              //     ),
                              //   ],
                              // )
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 25.w,
                right: 20.w,
                bottom: 15.h,
              ),
              child: SizedBox(
                  width: 600.w,
                  child: appoinmentdetails != null
                      ? Text(
                          appoinmentdetails.problem,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: const Color(0xff3C3C3C),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            ),
            patientcard(appoinmentdetails),
            prescriptionDownload(
              icon: Icons.file_present_rounded,
              name: 'Previous Prescription.jpg',
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideocallingPage()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    primary: Color(0xff128041),
                    textStyle: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.bold)),
                child: Center(
                  child: Text(
                    "Start Consultant",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget patientcard(appoinmentdetails) {
    DateDuration age;
    var payment;
    var blood;
    if (appoinmentdetails != null) {
      age = AgeCalculator.age(
        appoinmentdetails.patient.dateOfBirth,
      );

      payment = appoinmentdetails.paymentStatus;
      blood = appoinmentdetails.patient.bloodGroup;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffffffff), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat("dd.MM.yyyy").format(
                            widget.pandingDotorAppoinment.appointmentDate),
                        style: GoogleFonts.ubuntu(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          DateFormat("h:mma").format(
                              widget.pandingDotorAppoinment.sheduleTime),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.pandingDotorAppoinment.fee + " Tk",
                    style: GoogleFonts.ubuntu(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Payment :',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: const Color(0xFF2A1663),
                        fontWeight: FontWeight.w500,
                      )),
                  appoinmentdetails != null
                      ? Text(payment,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: const Color(0xFF2A1663),
                            fontWeight: FontWeight.w500,
                          ))
                      : Text('',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: const Color(0xFF2A1663),
                            fontWeight: FontWeight.w500,
                          ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 250.w,
                child: Text(
                  userdatashowdecode['first_name'].toString().toUpperCase() +
                      " " +
                      userdatashowdecode['last_name'].toString().toUpperCase(),
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Age : ',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(age.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  // Row(
                  //   children: [Text('Weight :  '), Text('25')],
                  // ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Blood Group :',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              )),
                          appoinmentdetails != null
                              ? Text(blood,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                  ))
                              : Text('',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                  )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Family Member",
                    style: GoogleFonts.ubuntu(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 250.w,
                              child: widget.pandingDotorAppoinment
                                          .patientDetails !=
                                      null
                                  ? Text(
                                      "Patient Name: " +
                                          widget.pandingDotorAppoinment
                                              .patientDetails.firstName +
                                          " " +
                                          widget.pandingDotorAppoinment
                                              .patientDetails.lastName,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12.0,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  : const SizedBox()),
                          SizedBox(
                              width: 250,
                              child: widget.pandingDotorAppoinment
                                          .patientDetails !=
                                      null
                                  ? Text(
                                      "Phone no: " +
                                          widget.pandingDotorAppoinment
                                              .patientDetails.phone,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12.0,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  : const SizedBox()),
                          SizedBox(
                              width: 250,
                              child: widget.pandingDotorAppoinment
                                          .patientDetails !=
                                      null
                                  ? Text(
                                      "Gender: " +
                                          widget.pandingDotorAppoinment
                                              .patientDetails.gender,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12.0,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  : const SizedBox()),
                          SizedBox(
                              width: 250,
                              child: widget.pandingDotorAppoinment
                                          .patientDetails !=
                                      null
                                  ? Text(
                                      "Gender: " +
                                          widget.pandingDotorAppoinment
                                              .patientDetails.bloodGroup,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12.0,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  : const SizedBox()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
