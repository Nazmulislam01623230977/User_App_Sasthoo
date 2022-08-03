import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Route/route.dart';

class NewPassWordPage extends StatefulWidget {
  NewPassWordPage({Key key}) : super(key: key);

  @override
  State<NewPassWordPage> createState() => _NewPassWordPageState();
}

class _NewPassWordPageState extends State<NewPassWordPage> {
  TextEditingController newpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Center(
              child: Text(
                'Create new password',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color(0xff128041),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: Text(
                'Your new password must be different from old password.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          buildnew(newpassController, context),
          buildConfirm(newpassController, context),
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
                      .popAndPushNamed(RouteManeger.loginin_page);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm',
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
      )),
    );
  }
}

Widget buildnew(newpassController, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'New Password',
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

            controller: newpassController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                hintText: '',
                hintStyle: TextStyle(
                    fontSize: 12.0, color: Color(0xffA7ADBC))), //A7ADBC
          ),
        )
      ],
    ),
  );
}

Widget buildConfirm(newpassController, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Confirm password',
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

            controller: newpassController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                hintText: '',
                hintStyle: TextStyle(
                    fontSize: 12.0, color: Color(0xffA7ADBC))), //A7ADBC
          ),
        )
      ],
    ),
  );
}
