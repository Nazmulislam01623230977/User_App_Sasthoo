import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Route/route.dart';
import '../controller/loginController.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends StateMVC<MainDrawer> {
  LoginController logoutfunction;
  _MainDrawerState() : super(LoginController()) {
    logoutfunction = controller as LoginController;
  }
  bool isvisible5 = false;
  bool isvisible6 = false;
  bool isvisible7 = false;
  bool isvisible8 = false;
  bool isvisible9 = false;
  bool isvisible10 = false;
  void internaterror(String massge, BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(massge),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  cerculerShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff464645),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/fonts/images/drawer.png'),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Digital Shastho',
                        style: GoogleFonts.roboto(
                          color: const Color(0xffFFFFFF),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  // height: 1.5,
                  thickness: 1.h,
                  color: const Color(0xffB8B8B8),
                ),
                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Color(0xffFFFFFF),
                      ),
                      title: Text(
                        'Home',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManeger.dashboad_page);
                      }),
                ),
                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Color(0xffFFFFFF),
                      ),
                      title: Text(
                        'Profile',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManeger.userprofile_page);
                      }),
                ),
                SizedBox(
                  height: 45.h,
                  width: 388.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible5 == false
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Doctors Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible5 = !isvisible5;
                                      });
                                    },
                                    child: isvisible5 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Doctors Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible5 = !isvisible5;
                                      });
                                    },
                                    child: isvisible5 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible5 = !isvisible5;
                        //       });
                        //     },
                        //     icon: isvisible5 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 30.h,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 30.h,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 55.w),
                              child: SizedBox(
                                // width: 200.w,
                                child: ListTile(
                                    leading: Icon(
                                      Icons.document_scanner_sharp,
                                      color: const Color(0xffFFFFFF),
                                      size: 18.sp,
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 7.h),
                                      child: Text(
                                        'Appoinment list',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xffFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).popAndPushNamed(
                                          RouteManeger.doctorappoinmentlist);
                                    }),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 388.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, bottom: 5.h, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible6 == false
                            ? Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Nurse Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 37.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible6 = !isvisible6;
                                      });
                                    },
                                    child: isvisible6 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Nurse Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 37.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible6 = !isvisible6;
                                      });
                                    },
                                    child: isvisible6 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible6 = !isvisible6;
                        //       });
                        //     },
                        //     icon: isvisible6 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 30.sp,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 30.sp,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible6,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 55.w),
                              child: SizedBox(
                                // width: 200.w,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.document_scanner_sharp,
                                    color: const Color(0xffFFFFFF),
                                    size: 20.sp,
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(bottom: 5.h),
                                    child: Text(
                                      'Nurse booked',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  // onTap: () {
                                  //   Navigator.of(context).popAndPushNamed(
                                  //       RouteManeger.doctorappoinmentlist);
                                  // }
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, bottom: 5.h, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible7 == false
                            ? Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Ambulance Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible7 = !isvisible7;
                                      });
                                    },
                                    child: isvisible7 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Ambulance Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible7 = !isvisible7;
                                      });
                                    },
                                    child: isvisible7 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible7 = !isvisible7;
                        //       });
                        //     },
                        //     icon: isvisible7 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible7,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 55.w),
                            child: SizedBox(
                              width: 250.w,
                              child: ListTile(
                                leading: Icon(
                                  Icons.document_scanner_sharp,
                                  color: const Color(0xffFFFFFF),
                                  size: 20.sp,
                                ),
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 5.h),
                                  child: Text(
                                    'Ambulance booked',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                // onTap: () {
                                //   Navigator.of(context).popAndPushNamed(
                                //       RouteManeger.doctorappoinmentlist);
                                // }
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 388.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, bottom: 5.h, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible8 == false
                            ? Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Madicine Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isvisible8 = !isvisible8;
                                        });
                                      },
                                      child: isvisible8 == false
                                          ? Icon(
                                              Icons.arrow_drop_down,
                                              size: 30.sp,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_up,
                                              size: 30.sp,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Madicine Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isvisible8 = !isvisible8;
                                        });
                                      },
                                      child: isvisible8 == false
                                          ? Icon(
                                              Icons.arrow_drop_down,
                                              size: 30.sp,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_up,
                                              size: 30.sp,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible8 = !isvisible8;
                        //       });
                        //     },
                        //     icon: isvisible8 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 55.w),
                            child: SizedBox(
                              width: 250.w,
                              child: ListTile(
                                leading: Icon(
                                  Icons.document_scanner_sharp,
                                  color: const Color(0xffFFFFFF),
                                  size: 20.sp,
                                ),
                                title: Text(
                                  'Madicine order list',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffFFFFFF),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // onTap: () {
                                //   Navigator.of(context).popAndPushNamed(
                                //       RouteManeger.doctorappoinmentlist);
                                // }
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 388.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, bottom: 5.h, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          child: Icon(
                            Icons.play_arrow,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible9 == false
                            ? Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Gym Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 39.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isvisible9 = !isvisible9;
                                        });
                                      },
                                      child: isvisible9 == false
                                          ? Icon(
                                              Icons.arrow_drop_down,
                                              size: 30.sp,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_up,
                                              size: 30.sp,
                                              color: Colors.white,
                                            ),
                                    ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Gym Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 39.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isvisible9 = !isvisible9;
                                        });
                                      },
                                      child: isvisible9 == false
                                          ? Icon(
                                              Icons.arrow_drop_down,
                                              size: 30.sp,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_up,
                                              size: 30.sp,
                                              color: Colors.white,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible9 = !isvisible9;
                        //       });
                        //     },
                        //     icon: isvisible9 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 55.w),
                            child: SizedBox(
                              width: 200.w,
                              child: ListTile(
                                leading: Icon(
                                  Icons.document_scanner_sharp,
                                  color: const Color(0xffFFFFFF),
                                  size: 20.sp,
                                ),
                                title: Text(
                                  'Gym list',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffFFFFFF),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // onTap: () {
                                //   Navigator.of(context).popAndPushNamed(
                                //       RouteManeger.doctorappoinmentlist);
                                // }
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, bottom: 5.h, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        isvisible10 == false
                            ? Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Madical Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible10 = !isvisible10;
                                      });
                                    },
                                    child: isvisible10 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                    SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('Madical Service',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff128041),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isvisible10 = !isvisible10;
                                      });
                                    },
                                    child: isvisible10 == false
                                        ? Icon(
                                            Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_up,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                  )
                                ],
                              ),
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         isvisible10 = !isvisible10;
                        //       });
                        //     },
                        //     icon: isvisible10 == false
                        //         ? Icon(
                        //             Icons.arrow_drop_down,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           )
                        //         : Icon(
                        //             Icons.arrow_drop_up,
                        //             size: 25.h,
                        //             color: Colors.white,
                        //           ))
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Visibility(
                  visible: isvisible10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 55.w),
                            child: SizedBox(
                              width: 200.w,
                              child: ListTile(
                                leading: Icon(
                                  Icons.document_scanner_sharp,
                                  color: const Color(0xffFFFFFF),
                                  size: 20.sp,
                                ),
                                title: Text(
                                  'Madical list',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffFFFFFF),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // onTap: () {
                                //   Navigator.of(context).popAndPushNamed(
                                //       RouteManeger.doctorappoinmentlist);
                                // }
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 45.h,
                  width: 388.w,
                  child: ListTile(
                      leading: const Icon(
                        Icons.language,
                        color: Color(0xffFFFFFF),
                      ),
                      title: Text(
                        'Language',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManeger.languagepage_page);
                      }),
                ),
                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Color(0xffFFFFFF),
                      ),
                      title: Text(
                        'Setting',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        // Navigator.of(context)
                        //     .popAndPushNamed(RouteManeger.dashboad_page);
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),

                SizedBox(
                  height: 40.h,
                  width: 388.w,
                  child: ListTile(
                      leading: const Icon(
                        Icons.money,
                        color: Color(0xffFFFFFF),
                      ),
                      title: Text(
                        'Transactions',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManeger.translation_page);
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),

                SizedBox(
                  height: 50.h,
                  width: 388.w,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 50.h,
                        width: double.infinity,
                        color: const Color(0xff128041),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              // Icon(Icon)
                              IconButton(
                                  onPressed: () {
                                    logoutfunction.logout(context);
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Logout',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
