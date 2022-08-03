import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../generated/l10n.dart';

class DoneAppoinmentPage extends StatefulWidget {
  const DoneAppoinmentPage({Key key}) : super(key: key);

  @override
  State<DoneAppoinmentPage> createState() => _DoneAppoinmentPageState();
}

class _DoneAppoinmentPageState extends State<DoneAppoinmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              // child: Image.asset(
              //   "assets/images/logo.png",
              //   height: 80,
              //   width: 80,
              // ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 31, bottom: 31),
            child: Center(child: Image.asset('assets/images/gift.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 11),
            child: Text(
              S.of(context).appoinment_Congratulations,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            S.of(context).appoinment_succcesfully,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 70),
            child: Text(
              S.of(context).appoinment_succcesfully2,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
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
                      .popAndPushNamed(RouteManeger.doctorhistory_page);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).appoinment_download,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 255, 249, 249),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
