import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../models/nearbydoctor_list_model.dart';

// ignore: must_be_immutable
class NearlDoctorWeiget extends StatefulWidget {
  NearbyDoctorList neardoctorlistbywidget;
  NearlDoctorWeiget({Key key, this.neardoctorlistbywidget}) : super(key: key);

  @override
  State<NearlDoctorWeiget> createState() => _NearlDoctorWeigetState();
}

class _NearlDoctorWeigetState extends State<NearlDoctorWeiget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 388.w,
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF), //E9F2F2
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 8, top: 20.h),
        child: Row(
          children: [
            Column(
              children: [
                widget.neardoctorlistbywidget.userPhotos.isNotEmpty
                    ? Column(
                        children: List.generate(
                            widget.neardoctorlistbywidget.userPhotos.length,
                            (index) {
                        var imagephoto =
                            widget.neardoctorlistbywidget.userPhotos.last;

                        return CircleAvatar(
                          backgroundImage: NetworkImage(
                              Baseurl.mainurl + "/" + imagephoto.avater),
                          radius: 30.r,
                        );
                      }))
                    : CircleAvatar(
                        radius: 30.r,
                        backgroundImage:
                            const AssetImage('assets/fonts/images/noimage.png'),
                      ),
              ],
            ),
            SizedBox(
              width: 17.w,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    RouteManeger.doctorprofile_page,
                    arguments: (widget.neardoctorlistbywidget));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.neardoctorlistbywidget.firstName +
                        " " +
                        widget.neardoctorlistbywidget.lastName,
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                      children: List.generate(
                          widget.neardoctorlistbywidget.educationExpriance
                              .length, (index) {
                    return Text(
                      widget.neardoctorlistbywidget.educationExpriance[index]
                              .examination +
                          "," +
                          "\n" +
                          "||" +
                          widget.neardoctorlistbywidget
                              .educationExpriance[index].instituteName +
                          "\n",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  })),
                  Row(
                      children: List.generate(
                          widget.neardoctorlistbywidget.doctorSpeciality.length,
                          (index) {
                    var speciality =
                        widget.neardoctorlistbywidget.doctorSpeciality.last;

                    return Text(
                      speciality.specialitie,
                      style: GoogleFonts.roboto(
                        color: const Color(0xff01BE4D),
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  })),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 10.h,
                        color: Colors.yellow,
                      ),
                      Icon(Icons.star, size: 10.h, color: Colors.yellow),
                      Icon(Icons.star, size: 10.h, color: Colors.yellow),
                      Icon(Icons.star, size: 10.h, color: Colors.yellow),
                      Icon(Icons.star, size: 10.h, color: Colors.yellow),
                    ],
                  )
                ],
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, bottom: 10),
              //   child: Container(
              //     height: 100,
              //     width: 1,
              //     color: Colors.black,
              //   ),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, bottom: 0),
              //   child: Column(
              //     // mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // Text(
              //       //   widget.neardoctor.camberaddress,
              //       //   style: const TextStyle(
              //       //       color: Color.fromARGB(255, 24, 24, 24),
              //       //       fontSize: 12,
              //       //       fontWeight: FontWeight.bold,
              //       //       fontFamily: 'Roboto'),
              //       // ),
              //     ],
              //   ),
              // )
            )
          ],
        ),
      ),
    );
  }
}

