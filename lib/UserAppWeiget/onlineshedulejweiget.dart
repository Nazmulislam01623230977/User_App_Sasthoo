// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/doctor_shedule.dart';

class Onlineshedule extends StatefulWidget {
  Doctorschedule shediuleinfo;
  var starttimee;
  var endtimee;
  Onlineshedule({this.shediuleinfo, this.starttimee, this.endtimee});

  @override
  _OnlinesheduleState createState() =>
      _OnlinesheduleState(this.starttimee, this.endtimee);
}

class _OnlinesheduleState extends State<Onlineshedule> {
  var starttimee;
  var endtimee;
  _OnlinesheduleState(this.starttimee, this.endtimee);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
      ),
      child: Container(
        decoration:  BoxDecoration(color: const Color(0xffffffff), //E9F2F2
            borderRadius: BorderRadius.circular(1.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1,
                offset: Offset(0, 1),
              )
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      widget.shediuleinfo.day,
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000)),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(starttimee.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Start Time : ',
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000)),
                            ),
                            Text(
                              DateFormat("h:mma").format(
                                  DateTime.parse(starttimee[index]['value'])),
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        );
                      })),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(endtimee.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'End Time : ',
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000)),
                            ),
                            Text(
                              DateFormat("h:mma").format(
                                  DateTime.parse(endtimee[index]['value'])),
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        );
                      })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
