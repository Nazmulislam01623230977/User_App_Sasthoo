import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Route/route.dart';
import '../api/apiurl.dart';
import '../models/doctor_appoinment_list.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DoctpandingAppoinment extends StatefulWidget {
  DoctorAppoinmentForUser pandingDotorAppoinment;
  DoctpandingAppoinment({Key key, this.pandingDotorAppoinment})
      : super(key: key);
  @override
  _DoctpandingAppoinmentState createState() => _DoctpandingAppoinmentState();
}

class _DoctpandingAppoinmentState extends State<DoctpandingAppoinment> {
  // ignore: prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
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
        padding: EdgeInsets.only(top: 9.h, left: 23.w, right: 23.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      DateFormat("dd.MM.yyyy").format(
                          widget.pandingDotorAppoinment.appointmentDate),
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Text(
                        DateFormat("h:mma")
                            .format(widget.pandingDotorAppoinment.sheduleTime),
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.pandingDotorAppoinment.fee + " Tk",
                  style: GoogleFonts.poppins(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  child: widget.pandingDotorAppoinment.doctorPhotos != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(Baseurl.mainurl +
                              "/" +
                              widget
                                  .pandingDotorAppoinment.doctorPhotos.avater),
                          radius: 20.r,
                        )
                      : CircleAvatar(
                          backgroundImage: const AssetImage(
                              'assets/fonts/images/noimage.png'),
                          radius: 20.r,
                        ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SizedBox(
                          width: 250.w,
                          child: Text(
                            widget.pandingDotorAppoinment.doctors.firstName +
                                " " +
                                widget.pandingDotorAppoinment.doctors.lastName,
                            style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          )),
                    ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     child: SizedBox(
                    //         width: 250,
                    //         child: widget.pandingDotorAppoinment.patientDetails !=
                    //                 null
                    //             ? Text(
                    //                 "Patient Name: " +
                    //                     widget.pandingDotorAppoinment
                    //                         .patientDetails.firstName +
                    //                     " " +
                    //                     widget.pandingDotorAppoinment
                    //                         .patientDetails.lastName,
                    //                 style: GoogleFonts.ubuntu(
                    //                   fontSize: 12.0,
                    //                   color: const Color.fromARGB(255, 0, 0, 0),
                    //                 ),
                    //               )
                    //             : const SizedBox()),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     child: SizedBox(
                    //         width: 250,
                    //         child: widget.pandingDotorAppoinment.patientDetails !=
                    //                 null
                    //             ? Text(
                    //                 "Phone no: " +
                    //                     widget.pandingDotorAppoinment
                    //                         .patientDetails.phone,
                    //                 style: GoogleFonts.ubuntu(
                    //                   fontSize: 12.0,
                    //                   color: const Color.fromARGB(255, 0, 0, 0),
                    //                 ),
                    //               )
                    //             : const SizedBox()),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     child: SizedBox(
                    //         width: 250,
                    //         child: widget.pandingDotorAppoinment.patientDetails !=
                    //                 null
                    //             ? Text(
                    //                 "Gender: " +
                    //                     widget.pandingDotorAppoinment
                    //                         .patientDetails.gender,
                    //                 style: GoogleFonts.ubuntu(
                    //                   fontSize: 12.0,
                    //                   color: const Color.fromARGB(255, 0, 0, 0),
                    //                 ),
                    //               )
                    //             : const SizedBox()),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     child: SizedBox(
                    //         width: 250,
                    //         child: widget.pandingDotorAppoinment.patientDetails !=
                    //                 null
                    //             ? Text(
                    //                 "Gender: " +
                    //                     widget.pandingDotorAppoinment
                    //                         .patientDetails.bloodGroup,
                    //                 style: GoogleFonts.ubuntu(
                    //                   fontSize: 12.0,
                    //                   color: const Color.fromARGB(255, 0, 0, 0),
                    //                 ),
                    //               )
                    //             : const SizedBox()),
                    //   ),
                  ],
                ),
                // const SizedBox(
                //   width: 60,
                // ),
                // IconButton(
                //     onPressed: () {}, icon: const Icon(Icons.video_call)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 23.w, right: 23.w),
              child: Divider(
                color: const Color(0xff959595),
                thickness: 1.h,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        RouteManeger.seduledatils,
                        arguments: (widget.pandingDotorAppoinment));
                  },
                  child: Text(
                    "See Shedule",
                    style: GoogleFonts.poppins(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff128041),
                    ),
                  ),
                ),
                SizedBox(width: 190.w,),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'cancel',
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    )),
                 SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
