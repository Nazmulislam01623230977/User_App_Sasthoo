import 'dart:convert';
import 'package:digital_sasthoo_user/Doctor/selfdoctorshedule_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../apitoken/apitoken.dart';
import '../apitoken/userinfo.dart';
import '../controller/add_patient_controller.dart';
import '../generated/l10n.dart';
import '../models/patient_list_models.dart';
import '../repository/patient_repositroy.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'doctorshecdulepage.dart';
import 'patientedit.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PatientAppoinmentPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var tocotordata;
  PatientAppoinmentPage(this.tocotordata, {Key key}) : super(key: key);

  @override
  _PatientAppoinmentPageState createState() =>
      // ignore: no_logic_in_create_state
      _PatientAppoinmentPageState(tocotordata);
}

class _PatientAppoinmentPageState extends StateMVC<PatientAppoinmentPage> {
  // ignore: prefer_typing_uninitialized_variables
  var tocotordata;
  AddPatientController con;
  _PatientAppoinmentPageState(this.tocotordata)
      : super(AddPatientController()) {
    con = controller as AddPatientController;
  }

  List<PatienList> patientlist;
  var isLoaded = false;
  getdata() async {
    await gettoken();
    await GetuserDataFromAPi.getuserdata();
    patientlist = await PatientService().getPatientData();
    if (patientlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getdata();
    userdataget();
    super.initState();
  }

  var photo;
  var avater;

  userdataget() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userdatashow = sharedPreferences.getString('userdata');
    var userdatashowdecode = jsonDecode(userdatashow);
    avater = userdatashowdecode['photo'];
    if (avater != null) {
      photo = avater['avater'].toString();
    }
    setState(() {
      userdatashowdecode = userdatashowdecode;
      photo = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.of(context).popAndPushNamed(RouteManeger.doctorprofile_page);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffFfffff),
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
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(RouteManeger.userprofile_page);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: avater != null
                        ? CircleAvatar(
                            radius: 20, // Image radius
                            backgroundImage: NetworkImage(
                              Baseurl.mainurl + "/" + photo,
                            ))
                        : const CircleAvatar(
                            radius: 20, // Image radius
                            backgroundImage: AssetImage(
                              "assets/fonts/images/logo.png",
                            ),
                          )),
              ),
            ],
          ),
          drawer: const MainDrawer(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF3FEF8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      )),
                  height: 148.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 31.h, left: 53.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.tocotordata.userPhotos.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        widget.tocotordata.userPhotos.length,
                                        (index) {
                                    var imagephoto =
                                        widget.tocotordata.userPhotos.last;

                                    return CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          Baseurl.mainurl +
                                              "/" +
                                              imagephoto.avater),
                                      radius: 35.r,
                                    );
                                  }))
                                : Column(children: [
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          'assets/fonts/images/noimage.png'),
                                      radius: 35.r,
                                    )
                                  ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tocotordata.firstName,
                            style: GoogleFonts.roboto(
                              fontSize: 22.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                              children: List.generate(
                                  widget.tocotordata.doctorSpeciality.length,
                                  (index) {
                            var speciality =
                                widget.tocotordata.doctorSpeciality.last;

                            return Text(
                              speciality.specialitie,
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          })),
                          // Text(
                          //   'physislist specialist',
                          //   style: GoogleFonts.poppins(
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w400,
                          //     color: Color(0xff000000),
                          //   ),
                          // ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10.h,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10.h,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10.h,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10.h,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    S.of(context).docpatient_Selectapatient,
                    // "Select a patient",
                    style: GoogleFonts.roboto(
                      // fontFamily: 'Roboto',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: patientlist != null
                      ? Container(
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
                          height: 140.h,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 33.w,
                                right: 25.h,
                                top: 31.h,
                                bottom: 31.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetuserDataFromAPi.userdata['photo'] != null
                                    ? Column(
                                        children: List.generate(1, (index) {
                                        var imagephoto = GetuserDataFromAPi
                                            .userdata['photo'];
                                        return CircleAvatar(
                                          backgroundImage: NetworkImage(Baseurl
                                                  .mainurl +
                                              "/" +
                                              imagephoto['avater'].toString()),
                                          radius: 35.r,
                                        );
                                      }))
                                    : Column(children: [
                                        CircleAvatar(
                                          backgroundImage: const AssetImage(
                                              'assets/fonts/images/noimage.png'),
                                          radius: 35.r,
                                        )
                                      ]),
                                SizedBox(
                                  width: 20.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelfghecdulePage(tocotordata)),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        GetuserDataFromAPi
                                                .userdata['first_name'] +
                                            " " +
                                            GetuserDataFromAPi
                                                .userdata['last_name'],
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        S.of(context).docpatient_Self,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.sp,
                                          color: const Color(0xffA8A7A7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: patientlist != null
                      ? ListView.builder(
                          itemCount: patientlist.length,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var patient = patientlist[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShecdulePage(tocotordata, patient)),
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF), //E9F2F2
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        )
                                      ]),
                                  height: 150.h,
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 25.h, left: 30.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: const AssetImage(
                                              'assets/fonts/images/noimage.png'),
                                          radius: 35.r,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              patient.firstName +
                                                  " " +
                                                  patient.lastName,
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.sp,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                            Text(
                                              patient.relationshipe,
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.sp,
                                                color: const Color(0xffA8A7A7),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  // shape: RoundedRectangleBorder(
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(
                                                  //             5.0),
                                                  //     side: const BorderSide(
                                                  //         color: Colors.red)),
                                                  onPressed: () =>
                                                      con.patientDelate(
                                                          tocotordata,
                                                          patient.id,
                                                          context),
                                                  color: Colors.white,
                                                  // textColor: Colors.black,
                                                  icon: const Icon(
                                                    Icons.delete_outlined,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                IconButton(
                                                  // shape: RoundedRectangleBorder(
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(
                                                  //             5.0),
                                                  //     side: const BorderSide(
                                                  //         color: Colors.green)),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EidtNewPatient(
                                                                  tocotordata,
                                                                  patient)),
                                                    );
                                                  },
                                                  color: Colors.white,
                                                  // textColor: Colors.black,
                                                  icon: const Icon(
                                                    Icons.edit_outlined,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(
                        RouteManeger.addpatient_page,
                        arguments: (tocotordata));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                      // color: Color.fromARGB(255, 236, 234, 229),
                      height: 140.h,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/fonts/images/add.png'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              // 'Add new Patient',
                              S.of(context).docpatient_Addnewpatient,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
