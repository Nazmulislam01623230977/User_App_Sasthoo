// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../apitoken/userinfo.dart';
import '../controller/loginController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../generated/l10n.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends StateMVC<UserProfilePage> {
  var userdatainfo;
  var photo;
  var avaters;
  userdata() async {
    await GetuserDataFromAPi.getuserdata();
    userdatainfo = GetuserDataFromAPi.userdata;

    if (userdatainfo != null) {
      avaters = userdatainfo['photo'];
      if (avaters != null) {
        photo = avaters['avater'].toString();
      }
      // photo = avaters['avater'].toString();
    }
    setState(() {
      userdatainfo = userdatainfo;
      photo = photo;
    });
  }

  File profilepic;
  final picker = ImagePicker();
  Future<File> file;
  void getImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    profilepic = File(pickedFile.path);
    LoginController().imagereuest(profilepic, context);
  }

  @override
  void initState() {
    userdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page),
      child: Scaffold(
        backgroundColor: const Color(0xffF3FAF8), //F3FAF8
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
            Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      RouteManeger.editprofilepage_page,
                      arguments: {userdatainfo});
                },
                child: Image.asset(
                  'assets/fonts/images/edit.png',
                  height: 18.h,
                  width: 18.w,
                ),
              ),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff128041),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  )),
              height: 140.h,
              width: 428.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                            width: 70.w,
                            height: 70.w,
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
                                image: avaters != null
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
                        Positioned(
                            bottom: 0,
                            right: 00,
                            // left: 10,
                            child: Container(
                              height: 40.h,
                              width: 40.w,
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
                                onPressed: () => getImage(context),
                                icon: const Icon(Icons.camera_alt_rounded,
                                    color: Color(0xff000000)),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Change profile picture',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
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
                  height: 438.h,
                  width: 388.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        // 'Personal Information',
                        S.of(context).Personal_information,
                        style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // 'Name                   :',
                              S.of(context).Profile_name,
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600, 
                              ),
                            ),
                            Text(
                              userdatainfo['first_name'].toString() +
                                  " " +
                                  userdatainfo['last_name'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
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
                            Text(
                              S.of(context).Profile_mobile,
                              // 'Mobile                 :',
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              userdatainfo['phone'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
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
                            Text(
                              // 'Email                   :',
                              S.of(context).Profile_email,
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              userdatainfo['email'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
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
                            Text(
                              S.of(context).Profile_date,
                              // 'Date Of Birth      :',
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              userdatainfo['date_of_birth'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
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
                      // Padding(
                      //   padding: EdgeInsets.only(left: 30.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Age                      :',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Text(
                      //         ' 22',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 30.w),
                      //   child: const Divider(
                      //     color: Color.fromARGB(137, 199, 193, 193),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 30.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Weiget                 :',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Text(
                      //         ' 72 ',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 30.w),
                      //   child: const Divider(
                      //     color: Color.fromARGB(137, 199, 193, 193),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 30.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Address              :',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Text(
                      //         ' 102/1,south ibrahimpur,Road !5 \nBlock 1,mirpur,Dhaka ',
                      //         style: GoogleFonts.roboto(
                      //           fontSize: 15.sp,
                      //           color: const Color.fromARGB(255, 0, 0, 0),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
