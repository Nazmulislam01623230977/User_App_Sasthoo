import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../UserAppWeiget/cancel_appoinment_list.dart';
import '../UserAppWeiget/complated_appoinment_list.dart';
import '../UserAppWeiget/pandingdoctor_appoinment.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/apiurl.dart';
import '../controller/appoinment_controller.dart';
import '../generated/l10n.dart';
import '../models/doctor_appoinment_list.dart';
import '../models/doctor_cancel_appoinment_list.dart';
import '../models/doctor_complatet_appoinment_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppoinmentHistory extends StatefulWidget {
  const DoctorAppoinmentHistory({Key key}) : super(key: key);

  @override
  _DoctorAppoinmentHistoryState createState() =>
      _DoctorAppoinmentHistoryState();
}

class _DoctorAppoinmentHistoryState extends State<DoctorAppoinmentHistory> {
  List<DoctorAppoinmentForUser> doctorappoinmentlist;
  List<DoctorCancelAppoinmentForUser> doctorcancelappoinmentlist;
  List<DoctorComplatedAppoinmentForUser> doctorcomplatedappoinmentlist;
  var isLoaded = false;

  pandinggetdata() async {
    doctorappoinmentlist = await AppoinmentController().pandingAppoinment();
    if (doctorappoinmentlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  cancelgetdata() async {
    doctorcancelappoinmentlist =
        await AppoinmentController().cancelAppoinment();
    if (doctorcancelappoinmentlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  complatedgetdata() async {
    doctorcomplatedappoinmentlist =
        await AppoinmentController().compatedAppoinment();
    if (doctorcomplatedappoinmentlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    pandinggetdata();
    cancelgetdata();
    complatedgetdata();
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
        Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page);
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
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
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h, top: 10.h),
                child: Text(
                  S.of(context).Appoinment_History,
                  // 'Appoinment History',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
                child: const Divider(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40.h,
                child: TabBar(
                  unselectedLabelColor: const Color(0xffffffff),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xff128041),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        // height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Active',
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          // border: Border.all(color: Colors.red, width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Complete',
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          // border: Border.all(color: Color.fromARGB(255, 4, 141, 11), width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Canceled',
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                  child: TabBarView(children: [
                SizedBox(
                    height: 100.h,
                    width: 500.w,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                      child: doctorappoinmentlist != null
                          ? ListView.builder(
                              itemCount: doctorappoinmentlist.length,
                              scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var pandingappoinment =
                                    doctorappoinmentlist[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: DoctpandingAppoinment(
                                      pandingDotorAppoinment:
                                          pandingappoinment),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    )),
                // Icon(Icons.app_blocking),

                SizedBox(
                    height: 100.h,
                    width: 500.w,
                    child: doctorcomplatedappoinmentlist != null
                        ? ListView.builder(
                            itemCount: doctorcomplatedappoinmentlist.length,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var complatedappoinment =
                                  doctorcomplatedappoinmentlist[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CompatedDoctorAppoinment(
                                    complatedDotorAppoinment:
                                        complatedappoinment),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
                SizedBox(
                    height: 100,
                    width: 500,
                    child: doctorcancelappoinmentlist != null
                        ? ListView.builder(
                            itemCount: doctorcancelappoinmentlist.length,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var cancelappoinment =
                                  doctorcancelappoinmentlist[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CancelAppoinmentList(
                                    cancelDotorAppoinment: cancelappoinment),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
