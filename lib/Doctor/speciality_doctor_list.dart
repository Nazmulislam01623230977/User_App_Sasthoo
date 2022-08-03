// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../UserAppWeiget/topdoctorweiget.dart';
import '../apitoken/apitoken.dart';
import '../controller/speciality_controller.dart';
import '../models/doctorlist_models.dart';

class SpecialityDoctorList extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var specialitysData;
  SpecialityDoctorList(this.specialitysData, {Key key}) : super(key: key);

  @override
  _SpecialityDoctorListState createState() =>
      _SpecialityDoctorListState(specialitysData);
}

class _SpecialityDoctorListState extends State<SpecialityDoctorList> {
  // ignore: prefer_typing_uninitialized_variables
  var specialitysData;
  _SpecialityDoctorListState(this.specialitysData);
  List<DoctorList> doctorlist;
  var isLoaded = false;

  doctorgetdata() async {
    await gettoken();
    doctorlist = await SpecialityController()
        .specialityDoctorList(specialitysData.specialitie);

    print(doctorlist);
    if (doctorlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<void> refreshfunction() async {
    doctorgetdata();
    return;
  }

  @override
  void initState() {
    doctorgetdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.of(context).popAndPushNamed(RouteManeger.doctordashboad_page);
      },
      child: SafeArea(
          child: RefreshIndicator(
        onRefresh: () => refreshfunction(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff128041),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Stack(
                  children: const [
                    Icon(
                      Icons.notifications_none,
                      color: Color.fromARGB(255, 255, 250, 250),
                    ),
                    Positioned(
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
              // const Padding(
              //   padding: EdgeInsets.only(right: 20),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 15,
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    specialitysData.specialitie,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: doctorlist != null
                        ? ListView.builder(
                            itemCount: doctorlist.length,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var topDoctor = doctorlist[index];
                              return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TopDoctorWeiget(
                                      topDoctorlist: topDoctor));
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
