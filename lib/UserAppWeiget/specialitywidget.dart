import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../models/speciality_model.dart';

// ignore: must_be_immutable
class SpecialityDoctor extends StatefulWidget {
  Specialiy specialitysData;
  SpecialityDoctor({Key key, this.specialitysData}) : super(key: key);
  @override
  _SpecialityDoctorState createState() => _SpecialityDoctorState();
}

class _SpecialityDoctorState extends State<SpecialityDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  Baseurl.mainurl + "/" + widget.specialitysData.avater),
              fit: BoxFit.fill,
            ),
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        width: MediaQuery.of(context).size.width * .20.w,
        child: Align(
            alignment: Alignment.bottomCenter,
            // ignore: deprecated_member_use

            child: InkWell(
              overlayColor: MaterialStateProperty.all(
                const Color(0xff128041),
              ),
              hoverColor: const Color(0xff128041),
              focusColor: const Color(0xff128041),
              splashColor: const Color(0xff128041),
              highlightColor: const Color(0xff128041),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    RouteManeger.specialitydoctorlist,
                    arguments: (widget.specialitysData));
              },
              child: FittedBox(
                child: Container(
                  height: MediaQuery.of(context).size.height * .02.h,
                  width: MediaQuery.of(context).size.width * .12.w,
                  child: Center(
                    child: Text(
                      widget.specialitysData.specialitie,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF31BB64),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            )));
  }
}
