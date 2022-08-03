import 'package:flutter/widgets.dart';

class Responsive {
  // function reponsible for providing value according to screensize
  getResponsiveValue(
      {dynamic forShortScreen,
      dynamic forMediumScreen,
      dynamic forLargeScreen,
      dynamic forMobLandScapeMode,
      dynamic forTabletScreen,
      BuildContext context}) {
    if (isLargeScreen(context)) {
      return forLargeScreen ?? forShortScreen;
    } else if (isMediumScreen(context)) {
      return forMediumScreen ?? forShortScreen;
    } else if (isTabletScreen(context)) {
      return forTabletScreen ?? forMediumScreen ?? forShortScreen;
    } else if (isSmallScreen(context) && isLandScapeMode(context)) {
      return forMobLandScapeMode ?? forShortScreen;
    } else {
      return forShortScreen;
    }
  }

  isLandScapeMode(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLargeScreen(BuildContext context) {
    return getWidth(context) > 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return getWidth(context) < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return getWidth(context) > 800 && getWidth(context) < 1200;
  }

  static bool isTabletScreen(BuildContext context) {
    return getWidth(context) > 450 && getWidth(context) < 800;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
// class ResponsiveWeiget extends StatelessWidget {
//   final Widget mobile;
//   final Widget tab;
//   final Widget desktop;

//   const ResponsiveWeiget(
//       {Key? key,
//       required this.mobile,
//       required this.tab,
//       required this.desktop})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, conistraints) {
//       if (conistraints.maxWidth < 786) {
//         return mobile;
//       } else(conistraints.maxWidth < 786 ){
//         return tab;
//       }
//     });
//   }
// }
