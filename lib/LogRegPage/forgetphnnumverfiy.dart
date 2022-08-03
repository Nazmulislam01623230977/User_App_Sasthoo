import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../Route/route.dart';

class ForgetOtp extends StatefulWidget {
  ForgetOtp({Key key}) : super(key: key);

  @override
  State<ForgetOtp> createState() => _ForgetOtpState();
}

class _ForgetOtpState extends State<ForgetOtp> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Phone Number Verification',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Color(0xff128041),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: Center(
                        child: Image.asset(
                          "assets/images/abc.jpeg",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 54),
                      child: Text(
                        'Get Code',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Please enter the 4 digit code',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff128041),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'sent to your email address.',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff128041),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                      child: PinFieldAutoFill(
                        textInputAction: TextInputAction.done,
                        controller: otpcontroller,
                        codeLength: 4,
                        onCodeChanged: (val) {
                          print('val');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'If you don’t receive code!',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xff172331),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Resend',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xff128041),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 56, right: 56, bottom: 35),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                            primary: Color(0xff128041), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed(
                                RouteManeger.forgetpassword_page);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Verify',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
