import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Drawer/drawer.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../controller/change_language.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({Key key}) : super(key: key);

  var photo;
  var avater;
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                //     InkWell(
                //       onTap: () {
                //         Navigator.of(context)
                //             .popAndPushNamed(RouteManeger.userprofile_page);
                //       },
                //       child: Padding(
                //           padding: EdgeInsets.only(right: 20.w),
                //           child: avater != null
                //               ? CircleAvatar(
                //                   radius: 20, // Image radius
                //                   backgroundImage: NetworkImage(
                //                     Baseurl.mainurl + "/" + photo,
                //                   ))
                //               : const CircleAvatar(
                //                   radius: 20, // Image radius
                //                   backgroundImage: AssetImage(
                //                     "assets/fonts/images/logo.png",
                //                   ),
                //                 )),
                //     ),
                //   ],
                // ),
              ]),
          drawer: const MainDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     context.read<LanguageChangeProvider>().changeLocale("hi");
                //     Navigator.of(context)
                //         .popAndPushNamed(RouteManeger.dashboad_page);
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         'assets/fonts/images/India.png',
                //         height: 20.h,
                //         width: 20.w,
                //         fit: BoxFit.cover,
                //       ),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "Hindi",
                //         style: GoogleFonts.roboto(
                //           color: Colors.white,
                //           fontSize: 15.sp,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     primary: const Color(0xff128041),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LanguageChangeProvider>().changeLocale("en");
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.dashboad_page);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/fonts/images/english.png',
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "English",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff128041),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LanguageChangeProvider>().changeLocale("bn");
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.dashboad_page);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/fonts/images/Bangladesh.png',
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Bangla",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff128041),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           context
                //               .read<LanguageChangeProvider>()
                //               .changeLocalethem(light);
                //           Navigator.of(context)
                //               .popAndPushNamed(RouteManeger.dashboad_page);
                //         },
                //         child: Text("light")),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           context
                //               .read<LanguageChangeProvider>()
                //               .changeLocalethem(dark);
                //           Navigator.of(context)
                //               .popAndPushNamed(RouteManeger.dashboad_page);
                //         },
                //         child: Text("dark")),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
