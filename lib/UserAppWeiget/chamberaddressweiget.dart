// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_this, no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Chamberaddressweiget extends StatefulWidget {
  var chamberaddress;
  Chamberaddressweiget({Key key, this.chamberaddress}) : super(key: key);

  @override
  State<Chamberaddressweiget> createState() =>
      _ChamberaddressweigetState(this.chamberaddress);
}

class _ChamberaddressweigetState extends State<Chamberaddressweiget> {
 
  var chamberaddress;
  _ChamberaddressweigetState(this.chamberaddress);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffffffff), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1,
                offset: Offset(0, 1),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFF4F4F4),
              height: 50.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.chamberaddress.chamberName,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    widget.chamberaddress.address,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 7.sp,
                    ),
                  ),
                  // Text(
                  //   widget.chamberaddress.description,
                  //   style: GoogleFonts.poppins(
                  //     color: const Color(0xFF000000),
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 8,
                  //   ),
                  // ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: chamberaddress.schedules.length,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var schedules = chamberaddress.schedules[index];

                var startTime = jsonDecode(schedules.startTime);
                var endTime = jsonDecode(schedules.endTime);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          schedules.day,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(startTime.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Start Time : ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  DateFormat("h:mma").format(DateTime.parse(
                                      startTime[index]['value'])),
                                  style: GoogleFonts.poppins(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            );
                          })),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(endTime.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 Text(
                                  'End Time : ',
                                   style: GoogleFonts.poppins(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  DateFormat("h:mma").format(
                                      DateTime.parse(endTime[index]['value'])),
                                    style: GoogleFonts.poppins(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                
                              ],
                            );
                          })),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
