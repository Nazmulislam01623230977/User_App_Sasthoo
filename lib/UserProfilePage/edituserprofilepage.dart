// ignore_for_file: no_logic_in_create_state, unnecessary_this, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../controller/loginController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../generated/l10n.dart';

// ignore: must_be_immutable
class EditProfilePage extends StatefulWidget {
  var genarelinformationdata;
  EditProfilePage(this.genarelinformationdata, {Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState(
        this.genarelinformationdata,
      );
}

class _EditProfilePageState extends StateMVC<EditProfilePage> {
  @override
  // ignore: prefer_typing_uninitialized_variables
  var genarelinformationdata;
  LoginController genarelinformationController = LoginController();
  _EditProfilePageState(this.genarelinformationdata) : super(LoginController());
  var userdatashowdecode;
  var userdatashow;
  String _tittleValue;
  String _genderValue;
  bool get hasFocus => false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController bmdcController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  userdatashoww() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _tittleValue = sharedPreferences.getString('title');
    });
    userdatashow = sharedPreferences.getString('userdata');
    userdatashowdecode = jsonDecode(userdatashow);
    firstnameController.text = "${userdatashowdecode['first_name'].toString()}";
    lastnameController.text = "${userdatashowdecode['last_name'].toString()}";
    _genderValue = "${userdatashowdecode['gender'].toString()}";
    emailController.text = "${userdatashowdecode['email'].toString()}";
    nidController.text = "${userdatashowdecode['nid'].toString()}";
    passportController.text = "${userdatashowdecode['passport'].toString()}";
    bmdcController.text = "${userdatashowdecode['bmdc_no'].toString()}";
    phoneController.text = "${userdatashowdecode['phone'].toString()}";
    _tittleValue = "${userdatashowdecode['title'].toString()}";
    print(_tittleValue);
  }

  void initState() {
    super.initState();
    userdatashoww();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.pop(context);
      },
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
            centerTitle: true,
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
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  // child: Image.asset(
                  //   "assets/images/logo.png",
                  //   height: 80,
                  //   width: 80,
                  // ),
                ),
              ),
            ]),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 8.h, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildfullname(firstnameController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildlastname(lastnameController, context),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
                  child: Text(
                    S.of(context).reg_gender,
                    // "Gender",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: const Color(0xFF323232),
                      fontWeight: FontWeight.w600,
                    ), //596970
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
                    child: Container(
                      height: 52.h,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff), //E9F2F2
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 8.w),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: _genderValue == null
                                ? Text(
                                    "Gender",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF323232),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(
                                    _genderValue.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF323232),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            isExpanded: true,
                            iconSize: 30.h,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xFF323232),
                              fontWeight: FontWeight.w600,
                            ),
                            items: ['Male', 'Female', 'Others'].map(
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
                                  _genderValue = val;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 5.h,
                ),
                buildemail(emailController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildnid(nidController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildphone(phoneController, context),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (firstnameController.text == "") {
                              internaterror(" Filled can't be blank ", context);
                            } else if (lastnameController.text == "") {
                              internaterror("Filled can't be blank", context);
                            } else if (emailController.text == "") {
                              internaterror("Filled can't be blank", context);
                            } else if (nidController.text == '') {
                              internaterror("Filled can't be blank ", context);
                            } else if (passportController.text == '') {
                              internaterror("Filled can't be blank ", context);
                            } else if (bmdcController.text == '') {
                              internaterror("Filled can't be blank", context);
                            } else if (phoneController.text == '') {
                              internaterror("Filled can't be blank ", context);
                            } else {
                              genarelinformationController
                                  .genarelinformationedit(
                                      _tittleValue,
                                      firstnameController.text,
                                      lastnameController.text,
                                      _genderValue,
                                      emailController.text,
                                      phoneController.text,
                                      nidController.text,
                                      passportController.text,
                                      bmdcController.text,
                                      context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff128041),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          child: Text(
                            S.of(context).pro_save,
                            // 'save',
                            style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 15.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ))),
                ),
                SizedBox(
                  height: 25.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildfullname(fullnameController, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).reg_fname,
          // "First Name",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: fullnameController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'First Name',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color(0xFF323232),
                  fontWeight: FontWeight.w600,
                ),
              ), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildlastname(lastnameController, context) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).reg_lname,
          // "Last Name",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: lastnameController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Last name',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color(0xFF323232),
                  fontWeight: FontWeight.w600,
                ),
              ), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildemail(emailController, context) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).reg_email,
          // "Email",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              enableInteractiveSelection: false, // will disable paste operation
              focusNode: new AlwaysDisabledFocusNode(),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'examplem@gmail.com',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color(0xFF323232),
                  fontWeight: FontWeight.w600,
                ),
              ), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildnid(nidController, context) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).reg_nid,
          // "NID Number",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              enableInteractiveSelection: false, // will disable paste operation
              focusNode:
                  new AlwaysDisabledFocusNode(), // will disable paste operation
              // focusNode:  AlwaysDisabledFocusNode(),
              controller: nidController,

              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '01XXXXXXXXX',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: const Color(0xFF323232),
                    fontWeight: FontWeight.w600,
                  )), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildnidpassport(passportController) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "NID/Passport Number",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              enableInteractiveSelection: false, // will disable paste operation
              focusNode: new AlwaysDisabledFocusNode(),
              controller: passportController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // prefixIcon: Icon(
                  //   Icons.password_rounded,
                  //   color: Color(0xffA7ADBC),
                  // ),
                  hintText: '0000000000',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: const Color(0xFF323232),
                    fontWeight: FontWeight.w600,
                  )), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildbmdc(bmdcController) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "BMDC Number",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              enableInteractiveSelection: false, // will disable paste operation
              focusNode: new AlwaysDisabledFocusNode(),
              controller: bmdcController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // prefixIcon: Icon(
                  //   Icons.format_list_numbered,
                  //   color: Color(0xffA7ADBC),
                  // ),
                  hintText: '0000000000',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: const Color(0xFF323232),
                    fontWeight: FontWeight.w600,
                  )), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildphone(phoneController, context) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).reg_mobile,
          // "Phone Number",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w600,
          ), //596970
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 52.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xffffffff), //E9F2F2
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.emailAddress,
              enableInteractiveSelection: false, // will disable paste operation
              focusNode: new AlwaysDisabledFocusNode(),
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '01XXXXXXXXX',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: const Color(0xFF323232),
                    fontWeight: FontWeight.w600,
                  )), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

void internaterror(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
