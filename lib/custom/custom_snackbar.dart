import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/dimensions.dart';

// void showCustomSnackBar(String message) {
//   Get.showSnackbar(GetSnackBar(
//     // backgroundColor: isError ? Colors.red : Colors.green,
//     message: message,
//     maxWidth: Dimensions.WEB_MAX_WIDTH,
//     duration: const Duration(seconds: 3),
//     snackStyle: SnackStyle.FLOATING,
//     margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//     borderRadius: Dimensions.RADIUS_SMALL,
//     isDismissible: true,
//     dismissDirection: DismissDirection.horizontal,
//   ));
// }

void showCustomSnackBar(String massge, BuildContext context,
    {bool isError = true}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
      // action: SnackBarAction(
      //     label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void showCustomSnackBarsuccess(String massge, BuildContext context,
    {bool isError = true}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
      // action: SnackBarAction(
      //     label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
