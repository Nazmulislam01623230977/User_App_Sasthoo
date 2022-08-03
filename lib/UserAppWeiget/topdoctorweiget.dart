import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Route/route.dart';

import '../api/apiurl.dart';
import '../models/doctorlist_models.dart';

// ignore: must_be_immutable
class TopDoctorWeiget extends StatefulWidget {
  DoctorList topDoctorlist;

  TopDoctorWeiget({Key key, this.topDoctorlist}) : super(key: key);

  @override
  State<TopDoctorWeiget> createState() => _TopDoctorWeigetState();
}

class _TopDoctorWeigetState extends State<TopDoctorWeiget> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 189.w,
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
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
              RouteManeger.doctorprofile_page,
              arguments: (widget.topDoctorlist));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 23.w,
                top: 10.w,
              ),
              child: widget.topDoctorlist.userPhotos.isNotEmpty
                  ? Column(
                      children: List.generate(
                          widget.topDoctorlist.userPhotos.length, (index) {
                      var imagephoto = widget.topDoctorlist.userPhotos.last;

                      return CircleAvatar(
                        backgroundImage: NetworkImage(
                            Baseurl.mainurl + "/" + imagephoto.avater),
                        radius: 30.r,
                      );
                    }))
                  : CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/fonts/images/noimage.png',
                      ),
                      radius: 30.r,
                    ),
            ),
            SizedBox(
              width: 17.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.topDoctorlist.firstName +
                        widget.topDoctorlist.lastName,
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                      children: List.generate(
                          widget.topDoctorlist.educationExpriance.length,
                          (index) {
                    return Text(
                      widget.topDoctorlist.educationExpriance[index]
                              .examination +
                          "," +
                          "\n" +
                          "||" +
                          widget.topDoctorlist.educationExpriance[index]
                              .instituteName +
                          "\n",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  })),
                  // SizedBox(
                  //   height: 4.h,
                  // ),
                  Row(
                      children: List.generate(
                          widget.topDoctorlist.doctorSpeciality.length,
                          (index) {
                    var speciality = widget.topDoctorlist.doctorSpeciality.last;

                    return Text(
                      speciality.specialitie,
                      style: GoogleFonts.roboto(
                        color: Colors.green,
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  })),
                  RatingBar.builder(
                      itemSize: 10.h,
                      minRating: 1,
                      initialRating: 5,
                      itemBuilder: (_, context) =>
                          const Icon(Icons.star, color: Colors.yellow),
                      onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
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
