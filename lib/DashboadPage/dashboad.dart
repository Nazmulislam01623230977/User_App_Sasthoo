// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../controller/loginController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';

class DashboadPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  const DashboadPage();

  @override
  State<DashboadPage> createState() => _DashboadPageState();
}

class _DashboadPageState extends State<DashboadPage> {
  final urlImages = [
    'assets/fonts/images/D-S app banner - 2-01.jpg',
    'assets/fonts/images/D-S app banner-01.jpg',
    'assets/fonts/images/D-S app banner-3-01.jpg',
    'assets/fonts/images/D-S app banner-4-01.jpg',
  ];
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

  userdatashoww() async {
    await userdataget();
  }

  @override
  void initState() {
    LoginController().userdata(context);
    userdatashoww();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      // onWillPop: () async {
      //   final shouldPop = await userdatafunction.showWarning(context);
      //   return shouldPop ?? false;
      // },
      child: Scaffold(
        backgroundColor: Colors.white, //F3FAF8
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
                          radius: 18, // Image radius
                          backgroundImage: NetworkImage(
                            Baseurl.mainurl + "/" + photo,
                          ))
                      : const CircleAvatar(
                          radius: 18, // Image radius
                          backgroundImage: AssetImage(
                            "assets/fonts/images/logo.png",
                          ),
                        )),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body:
            // SingleChildScrollView(
            Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff128041),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(19.r),
                    bottomRight: Radius.circular(19.r),
                  )),
              height: 140.h,
              child: Padding(
                padding: EdgeInsets.only(left: 53.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                // border: Border.all(
                                //     width: 4,
                                //     color: Theme.of(context)
                                //         .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                image: avater != null
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          Baseurl.mainurl + "/" + photo,
                                        ))
                                    : const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/fonts/images/noimage.png',
                                        )))),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).wel_come,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          userdatashowdecode['first_name']
                                  .toString()
                                  .toUpperCase() +
                              " " +
                              userdatashowdecode['last_name']
                                  .toString()
                                  .toUpperCase(),
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          date.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 94.h,
                    )),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.w),
              child: Text(
                  // 'Our Services.',
                  S.of(context).das_OurServices,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed(
                              RouteManeger.doctordashboad_page);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF), //E9F2F2
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ]),
                          height: 120.h,
                          width: 123.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 5.h),
                              Image.asset('assets/fonts/images/doctor.png'),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                // 'Doctor',
                                S.of(context).das_doctor,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 120.h,
                        width: 122.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Image.asset('assets/fonts/images/nurse.png'),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // 'Nurse',
                              S.of(context).das_nurse,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 120.h,
                        width: 122.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Image.asset('assets/fonts/images/ambulance.png'),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // 'Ambulance',
                              S.of(context).das_ambulance,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 120.h,
                        width: 123.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/fonts/images/medicine.png'),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // 'Medicine',
                              S.of(context).das_Medicine,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 120.h,
                        width: 122.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/fonts/images/gym.png'),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // 'Gym',
                              S.of(context).das_Gym,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 120.h,
                        width: 122.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/fonts/images/medical.png'),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // 'Medical',
                              S.of(context).das_Medical,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                // 'Be a Donor',
                S.of(context).das_BeaDonor,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF), //E9F2F2
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ]),
                    height: 140.h,
                    width: 189.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/fonts/images/blood.png'),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          // 'Blood Donate',
                          S.of(context).das_BloodDonate,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF), //E9F2F2
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ]),
                    height: 140.h,
                    width: 189.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/fonts/images/donation.png'),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          // 'Donation',
                          S.of(context).das_Donation,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 90,
            // ),
          ],
        ),
        // ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          height: 94.h,
          width: 388.w,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          color: const Color(0xff128041),
          // child: Image.network(
          //   urlImage,
          //   height: 94.h,
          //   //  width: 388.w,
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            urlImage,
            height: 94.h,
            //  width: 388.w,
            fit: BoxFit.cover,
          ),
        ),
      );
}
