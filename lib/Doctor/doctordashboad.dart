// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../UserAppWeiget/nearlydoctorweiget.dart';
import '../UserAppWeiget/specialitywidget.dart';
import '../UserAppWeiget/topdoctorweiget.dart';
import '../api/apiurl.dart';
import '../controller/speciality_controller.dart';
import '../generated/l10n.dart';
import '../models/doctorlist_models.dart';
import '../models/nearbydoctor_list_model.dart';
import '../models/speciality_model.dart';
import '../repository/doctor_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorDashboad extends StatefulWidget {
  const DoctorDashboad({Key key}) : super(key: key);

  @override
  State<DoctorDashboad> createState() => _DoctorDashboadState();
}

class _DoctorDashboadState extends State<DoctorDashboad> {
  List<DoctorList> doctorlist;
  List<Specialiy> speciality;
  List<NearbyDoctorList> nearbydoctorlist;
  var isLoaded = false;
  doctorgetdata() async {
    doctorlist = await DoctorService().getdoctordata();
    if (doctorlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  specialitydata() async {
    speciality = await SpecialityController().specialityfunction();
    if (speciality != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  nearbydoctordata() async {
    nearbydoctorlist = await SpecialityController().nearbydoctorlist();
    if (nearbydoctorlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
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
  void initState() {
    doctorgetdata();
    specialitydata();
    nearbydoctordata();
    userdataget();
    super.initState();
  }

  Future<void> refreshfunction() async {
    specialitydata();
    doctorgetdata();
    nearbydoctordata();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (){ Navigator.of(context)
                  .popAndPushNamed(RouteManeger.dashboad_page);},
      child: SafeArea(
          child: RefreshIndicator(
        onRefresh: () => refreshfunction(),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 252, 249, 249), //F3FAF8
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Center(
                    child: Container(
                      height: 50.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF), //E9F2F2
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: TextField(
                          // cursorColor: const Color.fromARGB(255, 17, 17, 17),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: " Search Doctor,Specilist",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                color: const Color(0xffD3D3D3),
                              ),
                              suffixIcon: Container(
                                height: 50.h,
                                width: 53.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff128041),
                                  borderRadius: BorderRadius.only(
                                    // topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.r),
                                    bottomRight: Radius.circular(30.r),
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.search, size: 25.h),
                                  color: const Color(0xffD3D3D3),
                                  onPressed: () {},
                                ),
                              )),
                          style: GoogleFonts.poppins(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    // 'Category',
                    S.of(context).docdas_Category,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: const Color(0xf0000000),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                      height: 70.h,
                      // width: 89.w,
                      child: speciality != null
                          ? ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: speciality.length,
                              separatorBuilder: (context, _) => SizedBox(
                                    width: 10.w,
                                  ),
                              itemBuilder: (context, index) {
                                var specialitys = speciality[index];
                                return SpecialityDoctor(
                                    specialitysData: specialitys);
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 26.h),
                  child: Text(
                    // 'Top Doctors',
                    S.of(context).docdas_TopDoctors,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SizedBox(
                      height: 215.h,
                      child: doctorlist != null
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: doctorlist.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 10.h,
                                      childAspectRatio: 7.5 / 3),
                              itemBuilder: (context, index) {
                                var topDoctor = doctorlist[index];
                                return TopDoctorWeiget(topDoctorlist: topDoctor);
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    // 'Nearly Doctors',
                    S.of(context).docdas_NearlyDoctors,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: nearbydoctorlist != null
                        ? ListView.builder(
                            itemCount: nearbydoctorlist.length,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var neard = nearbydoctorlist[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: NearlDoctorWeiget(
                                    neardoctorlistbywidget: neard),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
