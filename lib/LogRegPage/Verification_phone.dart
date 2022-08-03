// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Route/route.dart';
import '../controller/loginController.dart';
import '../generated/l10n.dart';
import 'loginpage.dart';

// ignore: camel_case_types
class Verification_phone extends StatefulWidget {
  const Verification_phone({Key key}) : super(key: key);

  @override
  _Verification_phoneState createState() => _Verification_phoneState();
}

// ignore: camel_case_types
class _Verification_phoneState extends StateMVC<Verification_phone> {
  LoginController phonefunction;
  _Verification_phoneState() : super(LoginController()) {
    phonefunction = controller as LoginController;
  }
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).popAndPushNamed(RouteManeger.loginin_page),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 108.w,
                    right: 108.w,
                    top: 42.h,
                    bottom: 48.h,
                  ),
                  child: Container(
                      height: 212.h,
                      width: 212.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/fonts/images/phnver.jpeg",
                            ),
                            // fit: BoxFit.fill,
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    S.of(context).welcome_text,
                    // 'Welcome to Digital Shastho',
                    style: GoogleFonts.poppins(
                      fontSize: 27.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Text(
                    S.of(context).plathfrom_text,
                    // 'A health concern platform of Bangladesh',
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: const Color(0xff128041),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 141.w,
                    right: 142.w,
                  ),
                  child: SizedBox(
                    height: 51.h,
                    width: 145.w,
                    child: Center(
                      child: Image.asset(
                        "assets/fonts/images/logo.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 54.h,
                ),
                buildPhone(phoneController, context),
                SizedBox(
                  height: 36.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 77.w, right: 73.w),
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
                        if (phoneController.text == "") {
                          internaterror(
                              "Phone number can't be empty ", context);
                        } else if (phoneController.text.length != 11) {
                          internaterror(
                              "Your phone number must be 11 digits ", context);
                        } else {
                          phonefunction.sendotp(phoneController.text, context);
                        }
                        // Navigator.of(context)
                        //     .popAndPushNamed(RouteManeger.otp_page);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).continue_button,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 52.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 87.w, right: 87.w),
                  child: Text(
                    S.of(context).phn_ver_text,
                    // 'After click on continue you will be process on verify',
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110.w, right: 110.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login_Page(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have a Account?  ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp),
                          ),
                          TextSpan(
                            text: S.of(context).Login_text,
                            // text: 'Login',
                            style: GoogleFonts.poppins(
                              color: const Color(0xffFF0D0D),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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

Widget buildPhone(phoneController, context) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          height: 52.h,
          width: 66.w,
          // width: MediaQuery.of(context).size.width * 0.2,
          // height: MediaQuery.of(context).size.height * 0.068,
          child: Center(
              child: Text(
            '+88',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
        ),
        SizedBox(
          width: 13.w,
        ),
        Container(
          height: 52.h,
          width: 309.w,
          // height: MediaQuery.of(context).size.height * 0.068,
          // width: MediaQuery.of(context).size.width * 0.65,
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
            padding: const EdgeInsets.only(top: 15, left: 20, bottom: 8),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
              ],
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Your Mobile Number ',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: const Color(0xffD3D3D3))), //A7ADBC
            ),
          ),
        )
      ],
    ),
  );
}
