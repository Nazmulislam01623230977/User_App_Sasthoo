import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Route/route.dart';

class ForgetPhoneNumPage extends StatefulWidget {
  ForgetPhoneNumPage({Key key}) : super(key: key);

  @override
  State<ForgetPhoneNumPage> createState() => _ForgetPhoneNumPageState();
}

class _ForgetPhoneNumPageState extends State<ForgetPhoneNumPage> {
  TextEditingController phoneNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 26),
              child: Center(
                child: Text(
                  'Reset Password',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xff128041),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Please enter your the phone number assosiated with account and we will send a verification code.',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            buildPhone(phoneNumController, context),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // <-- Radius
                    ),
                    primary: Color(0xff128041), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.forgetotp_page);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ' Proceed',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPhone(phoneNumController, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600),
          //596970
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.068,
          alignment: Alignment.centerLeft,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
            ],

            controller: phoneNumController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.black26,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
                hintText: '01788888888',
                hintStyle: TextStyle(
                    fontSize: 12.0, color: Color(0xffA7ADBC))), //A7ADBC
          ),
        )
      ],
    ),
  );
}
