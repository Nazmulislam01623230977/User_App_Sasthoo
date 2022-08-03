import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../generated/l10n.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFfffff),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset('assets/fonts/images/menu.png'));
        }),
        backgroundColor: const Color(0xff128041),
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Stack(
              children: const [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  left: 10,
                  child: Icon(
                    Icons.brightness_1,
                    color: Colors.red,
                    size: 9,
                  ),
                )
              ],
            ),
            onPressed: () {
              // do something
            },
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 20.w),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     radius: 20.r,
          //     // child: Image.asset(
          //     //   "assets/images/logo.png",
          //     //   height: 80,
          //     //   width: 80,
          //     // ),
          //   ),
          // ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 8.h),
              child: Text(
                "Patient information",
                style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.20,
              ),
              child: Container(
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
                height: 120,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 33.w, top: 5.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Patient Name",
                            style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Shakib Hasan',
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            " S.of(context).patientshecdule_Age",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '13',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "S.of(context).patientshecdule_Weight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '55',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "S.of(context).patientshecdule_Mobile,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '01623230977',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "S.of(context).information_Patientreason,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            'Brain Probleam',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 28),
              child: Text(
                "S.of(context).information_DoctorInformtion",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 28),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF), //E9F2F2
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]),
                height: 136,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 33, top: 19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            " S.of(context).information_DoctorName",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            'Shakib Hasan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            " S.of(context).information_AppointTime",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '03.00AM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "S.of(context).information_Appointdate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '02 mar 2022',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            " S.of(context).information_ChamberAddress",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            'Mirpur Dhaka',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  BuildCheckBox(),
                  Text(
                    "S.of(context).information_agree",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Roboto'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 56, right: 56, bottom: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                    primary: Color(0xff128041), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.paymentoption_page);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " S.of(context).information_payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 255, 249, 249),
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 56, right: 56, bottom: 30),
              child: Text(
                "S.of(context).information_checkpayment",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 14, 13, 13),
                    fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildCheckBox() => Checkbox(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      });
}
