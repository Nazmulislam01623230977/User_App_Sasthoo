// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Route/route.dart';
import '../controller/loginController.dart';
import '../generated/l10n.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends StateMVC<RegistrationPage> {
  LoginController regfunction;
  _RegistrationPageState() : super(LoginController()) {
    regfunction = controller as LoginController;
  }

  String _day;
  String _month;
  String _year;
  String _genderValue;
  String _bloodgroup;
  int _radioSelected = 1;
  bool _passwordVisible;
  String _radioVal;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime _currentdate = DateTime.now();
  var initialDate = DateTime.now();
  String selectdate;
  DateTime _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xff128041),
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
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));
    if (_seldate != null) {
      var day = _seldate.day;
      var month = _seldate.month;
      setState(() {
        _currentdate = _seldate;
        _selectedDate = _seldate;

        if (day < 10 && month < 10) {
          dateController.text =
              "${_seldate.year}-0${_seldate.month}-0${_seldate.day}";
        } else if (day < 10) {
          dateController.text =
              "${_seldate.year}-${_seldate.month}-0${_seldate.day}";
        } else if (month < 10) {
          dateController.text =
              "${_seldate.year}-0${_seldate.month}-${_seldate.day}";
        } else {
          dateController.text =
              "${_seldate.year}-${_seldate.month}-${_seldate.day}";
        }
      });
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).popAndPushNamed(RouteManeger.phnver_page),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 152.w, right: 153.w),
                  child: Text(
                    S.of(context).reg_head,
                    // 'Registration',
                    style: GoogleFonts.raleway(
                        color: const Color(0xff128041),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 106.w, right: 105.w),
                  child: Text(
                    S.of(context).nid_head,
                    // 'All information must be valid and as per NID',
                    style: GoogleFonts.roboto(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff989898)),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 106.w, right: 105.w),
                  child: Text(
                    S.of(context).nid_head1,
                    // '(All start mark must be required)',
                    style: GoogleFonts.roboto(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffFF3737)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildFiratname(fnameController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildlastname(lnameController, context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).reg_birth,
                            // 'Date of birth',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Text(
                          //   '(Applicants must be over 18)',
                          //   style: GoogleFonts.poppins(
                          //     fontSize: 12.sp,
                          //     color: const Color(0xff000000),
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'dd/mm/yyyy',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                ),
                                errorStyle: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.calendar_month_outlined,
                                      color: const Color(0xff128041),
                                      size: 25.h,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _selectDate(context);
                                      });
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).reg_gender,
                        // 'Gender*',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                        SizedBox(
                  height: 5.h,
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
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: _genderValue == null
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    child: Text(
                                      'Gender*',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      _genderValue,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                            isExpanded: true,
                            iconSize: 25.h,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
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
                      )
                    ],
                  ),
                ),
              
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Blood Group',
                        S.of(context).reg_blood,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
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
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: _bloodgroup == null
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    child: Text(
                                      'Blood Group*',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    child: Text(
                                      _bloodgroup,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                            isExpanded: true,
                            iconSize: 25.h,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                            items: [
                              'AB ',
                              'AB-',
                              'A+',
                              'A-',
                              'B-',
                              'B+',
                              'O-',
                              'O+',
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
                                  _bloodgroup = val;
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                buildnid(nidController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildemail(emailController, context),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Password',
                        S.of(context).reg_password,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(16),
                            ],
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _passwordVisible
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off,
                                    size: 15.h,
                                    color: const Color(
                                        0xffABABAB) //Theme.of(context).primaryColorDark,
                                    ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hintText: '********',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                            ), //A7ADBC
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // buildpassword(passwordController, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF128041)),
                        value: _radioSelected,
                        groupValue: _radioSelected,
                        onChanged: (_value) {
                          if (_value == 0) {
                            setState(() {
                              _value = 1;
                            });
                          } else {
                            setState(() {
                              _value = 0;
                            });
                          }
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).reg_text,
                              // text: " I accept and agree ",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp),
                            ),
                            TextSpan(
                              text: S.of(context).reg_text1,
                              // text: "Terms and Condition",
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF0A3496),
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: S.of(context).reg_text2,
                              // text: " and ",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp),
                            ),
                            TextSpan(
                              text: S.of(context).reg_text3,
                              // text: "Privacy Policy.",
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF0A3496),
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(19.r), // <-- Radius
                        ),
                        primary: const Color(0xff128041), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        if (nidController.text == "") {
                          internaterror(" Filled can't be blank ", context);
                        }
                        if (fnameController.text == "") {
                          internaterror(" Filled can't be blank ", context);
                        } else if (lnameController.text == "") {
                          internaterror("Filled can't be blank ", context);
                        } else if (emailController.text == "") {
                          internaterror("Filled can't be blank", context);
                        } else if (passwordController.text == "") {
                          internaterror("Filled can't be blank", context);
                        } else {
                          regfunction.regVerify(
                              fnameController.text,
                              lnameController.text,
                              dateController.text,
                              _genderValue,
                              _bloodgroup,
                              nidController.text,
                              emailController.text,
                              passwordController.text,
                              context);
                        }
                        // Navigator.of(context)
                        //     .popAndPushNamed(RouteManeger.dashboad_page);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 93.w, vertical: 8.h),
                        child: Text(
                          S.of(context).reg_head,
                          // 'Registration',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFffffff),
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).already_account,
                      // 'Already have an Account? ',
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManeger.loginin_page);
                      }),
                      child: Text(
                        S.of(context).sign_in,
                        // 'SIGN IN',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color(0xffFF3737),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFiratname(fnameController, context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'First Name',
          S.of(context).reg_fname,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 5.h,
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: fnameController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'First name ',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
              ), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildlastname(lnameController, context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'Last Name',
          S.of(context).reg_lname,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 5.h,
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: lnameController,
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
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
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
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'National Id Number*',
          S.of(context).reg_nid,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 5.h,
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
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
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
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
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'Email*',
          S.of(context).reg_email,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 5.h,
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Example@gmail.com',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
              ), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}
