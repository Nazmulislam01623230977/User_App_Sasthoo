import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../UserAppWeiget/activetabbarweiget.dart';
import '../UserModel/activetabbarmodel.dart';

class DoctorHistor extends StatefulWidget {
  DoctorHistor({Key key}) : super(key: key);

  @override
  State<DoctorHistor> createState() => _DoctorHistorState();
}

class _DoctorHistorState extends State<DoctorHistor> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff128041),
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
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
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
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  'History',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontFamily: 'Roboto'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Divider(
                  color: Color(0xffA8A7A7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 255, 255, 255),
                      // borderRadius: BorderRadius.circular(20),
                      ),
                  child: TabBar(
                    unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff128041),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              // color: Color(0xffFFFFFF), //E9F2F2
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Active',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  // color: Color.fromARGB(255, 7, 7, 7),
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0xffFFFFFF), //E9F2F2
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Complete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  // color: Color.fromARGB(255, 7, 7, 7),
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0xffFFFFFF), //E9F2F2
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Cancelled',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  // color: Color.fromARGB(255, 7, 7, 7),
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListView.builder(
                      itemCount: activetablist.length,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var activelist = activetablist[index];
                        return ActiveTabbarWeiget(active: activelist);
                      },
                    ),
                  ),
                ),
                // Icon(Icons.app_blocking),
                Icon(
                  Icons.movie,
                ),
                Icon(Icons.gamepad),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
