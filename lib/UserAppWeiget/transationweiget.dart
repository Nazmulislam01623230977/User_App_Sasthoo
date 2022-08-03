import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transationmodel.dart';

class TransationWeiget extends StatelessWidget {
  final TranstionModel transationmodel;
  const TransationWeiget({Key key, this.transationmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 21.h, top: 21.h, left: 23.w),
            child: Image.asset(
              transationmodel.imageUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transationmodel.name,
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transationmodel.date,
                      style: GoogleFonts.poppins(
                          fontSize: 8.sp,
                          color: const Color(0xff757575),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      transationmodel.time,
                      style: GoogleFonts.poppins(
                          fontSize: 8.sp,
                          color: const Color(0xff757575),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
               padding: EdgeInsets.only(top: 34.h,right: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  '৳',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600),
                ),

                Text(
                  transationmodel.tk,
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
