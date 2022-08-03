import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Doctor/patientedit.dart';
import '../Route/route.dart';
import '../api/apiurl.dart';
import '../apitoken/userinfo.dart';
import '../custom/custom_loader.dart';
import '../custom/custom_snackbar.dart';
import '../repository/add_patient_repository.dart';
import 'package:http/http.dart' as http;

import '../repository/doctor_appoinment_list.dart';

class DoctorAppoinmentController extends ControllerMVC {
  doctorBooking(var tocotordata, Map patientdata, BuildContext context) async {
    cerculerShowDialog(context);
    AddPatient.getdoctordata(patientdata);
    if (AddPatient.msg == "success") {
      showCustomSnackBarsuccess('Patient added successfully !!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.patientappoinment_page,
          arguments: (tocotordata));
    } else {
      showCustomSnackBar('Something went wrong !!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.addpatient_page,
          arguments: (tocotordata));
    }
  }

  patientDelate(var tocotordata, int id, BuildContext context) async {
    cerculerShowDialog(context);
    AddPatient.deletePatientData(id);
    if (AddPatient.msg == "success") {
      showCustomSnackBarsuccess('Patient deleted successfully !!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.patientappoinment_page,
          arguments: (tocotordata));
    } else {
      showCustomSnackBar('Something went wrong !!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.patientappoinment_page,
          arguments: (tocotordata));
    }
  }

  editpatient(var tocotordata, Map editpatientdata, var patientdata,
      BuildContext context) async {
    cerculerShowDialog(context);
    AddPatient.eidtPatientData(editpatientdata);
    if (AddPatient.msg == "success") {
      showCustomSnackBarsuccess('Patient deleted successfully !!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.patientappoinment_page,
          arguments: (tocotordata));
    } else {
      showCustomSnackBar('Something went wrong !!', context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EidtNewPatient(tocotordata, patientdata)),
      );
    }
  }
}
