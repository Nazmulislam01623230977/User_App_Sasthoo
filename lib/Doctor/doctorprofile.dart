// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../UserAppWeiget/chamberaddressweiget.dart';
import '../UserAppWeiget/onlineshedulejweiget.dart';
import '../api/apiurl.dart';
import '../controller/add_patient_controller.dart';
import '../generated/l10n.dart';
import '../models/doctor_shedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProfile extends StatefulWidget {
  var topDoctorlist;

  DoctorProfile(this.topDoctorlist, {Key key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState(this.topDoctorlist);
}

class _DoctorProfileState extends State<DoctorProfile> {
  var topDoctorlist;
  _DoctorProfileState(this.topDoctorlist);
  bool visble = true;
  bool visble2 = true;
  bool visble3 = true;

  List<Doctorschedule> onllineshedlie;
  var isLoaded = false;
  onlinesheduule() async {
    onllineshedlie = await AddPatientController()
        .doctorshedule(topDoctorlist.id.toString(), "Online", context);
    if (onllineshedlie != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    onlinesheduule();
    super.initState();
    userdataget();
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
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.of(context).popAndPushNamed(RouteManeger.doctordashboad_page);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFfffff), //F3FAF8
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF3FEF8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      )),
                  height: 160.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 53.w, top: 31.h),
                            child: widget.topDoctorlist.userPhotos.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        widget.topDoctorlist.userPhotos.length,
                                        (index) {
                                    var imagephoto =
                                        widget.topDoctorlist.userPhotos.last;

                                    return CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          Baseurl.mainurl +
                                              "/" +
                                              imagephoto.avater),
                                      radius: 35.r,
                                    );
                                  }))
                                : Column(children: [
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          'assets/fonts/images/noimage.png'),
                                      radius: 35.r,
                                    )
                                  ]),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.w),
                            child: Column(
                              children: [
                                Text(
                                  '(' +
                                      widget.topDoctorlist.reviewusers.length
                                          .toString() +
                                      '+ reviews)',
                                  style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    color: const Color(0xff128041),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.h,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.topDoctorlist.firstName +
                                " " +
                                widget.topDoctorlist.lastName,
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                              children: List.generate(
                                  widget.topDoctorlist.doctorSpeciality.length,
                                  (index) {
                            var speciality =
                                widget.topDoctorlist.doctorSpeciality.last;
                            return Text(
                              speciality.specialitie,
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          })),
                          Text(
                            'BMDC Code: ' +
                                widget.topDoctorlist.bmdcNo.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                              // children: topDoctorlist.chambers.isNotEmpty
                              //     ? List.generate(1, (index) {
                              //         var chamber =
                              //             widget.topDoctorlist.chambers.last;

                              //         return Column(
                              //             children: List.generate(1, (index) {
                              //           var schedule = chamber.schedules.last;

                              //           return Column(
                              //               children: List.generate(1, (index) {
                              //             var doctorfees =
                              //                 schedule.doctorfees.last;

                              //             return Text(
                              //               "Consultancy free " +
                              //                   doctorfees.newPatientFree +
                              //                   " Tk",
                              //               style: const TextStyle(
                              //                   color: Colors.black,
                              //                   fontSize: 16,
                              //                   fontWeight: FontWeight.bold,
                              //                   fontFamily: 'Roboto'),
                              //             );
                              //           }));
                              //         }));
                              //       })
                              //     : [
                              //         const Text(
                              //           "Consultancy free not found",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.bold,
                              //               fontFamily: 'Roboto'),
                              //         ),
                              // ]
                              //
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
                  child: Text(
                    // "About Doctor",
                    S.of(context).docpro_AboutDoctor,
                    style: GoogleFonts.ubuntu(
                      fontSize: 18.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    width: 600.w,
                    child: topDoctorlist.about.toString() != "null"
                        ? Text(
                            topDoctorlist.about.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: const Color(0xff434343),
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text(
                            S.of(context).docpro_dis,
                            // "No Description Found!",
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: const Color(0xff434343),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    color: const Color(0xFFF4F4F4),
                    height: 50.h,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).docpro_online,
                          // "Online chamber",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onllineshedlie != null
                    ? ListView.builder(
                        itemCount: onllineshedlie.length,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var shedule = onllineshedlie[index];
                          var startTime = jsonDecode(shedule.startTime);
                          var endTime = jsonDecode(shedule.endTime);
                          return Onlineshedule(
                              shediuleinfo: shedule,
                              starttimee: startTime,
                              endtimee: endTime);
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  itemCount: topDoctorlist.chambers.length,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var chamber = topDoctorlist.chambers[index];
                    return Chamberaddressweiget(chamberaddress: chamber);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 56.w, right: 56.w,top: 20.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.r), // <-- Radius
                        ),
                        primary: const Color(0xff128041), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed(
                            RouteManeger.patientappoinment_page,
                            arguments: (topDoctorlist));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 24.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              S.of(context).docpro_Makeaschedule,
                              // "Make a schedule",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 255, 249, 249),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 23.h,
                ),
              ]),
        ),
      ),
    );
  }
}
