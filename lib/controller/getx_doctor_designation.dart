import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/doctor_designation.dart';
import '../repository/doctor_appoinment_list.dart';

class GetxDoctorDesignation extends GetxController {
  final doctordesignation = <DoctorDesignation>[].obs;

  final isLoading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   doctordesignationdata();
  // }

  // void doctordesignationdata(String id) async {
  //   try {
  //     isLoading.value = true;
  //     await DoctorAppoinmentService().doctordesignatation(id).then((value) {
  //       doctordesignation.value = value as List<DoctorDesignation>;
  //     });
  //     print(doctordesignation);
  //   } catch (err) {
  //     print(err);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
