import 'package:digital_sasthoo_user/models/doctorlist_models.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Doctor/appoinmenrPreviewPage.dart';
import '../Doctor/doctorshecdulepage.dart';
import '../Doctor/patientedit.dart';
import '../Doctor/selfappoinmentPreviewPate.dart';
import '../Doctor/selfdoctorshedule_page.dart';
import '../Route/route.dart';
import '../custom/custom_loader.dart';
import '../custom/custom_snackbar.dart';
import '../repository/add_patient_repository.dart';
import '../repository/doctor_repository.dart';
import '../repository/doctor_sedule.dart';

class AddPatientController extends ControllerMVC {
  addpatient(var tocotordata, Map patientdata, BuildContext context) async {
    cerculerShowDialog(context);
    await AddPatient.getdoctordata(patientdata);
    if (AddPatient.msg.toString() == "success") {
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

  doctorshedule(String userId, onlinestatu, BuildContext context) async {
    var sheduleData = DoctorBookingService.getsheduledata(userId, onlinestatu);
    return sheduleData;
  }

  doctorsheduleforchamber(String userId, chamber, BuildContext context) async {
    var sheduleData =
        DoctorBookingService.getsheduledatachamber(userId, chamber);
    return sheduleData;
  }

  doctorsfee(String dud, patientstatus) async {
    await DoctorService.doctorfree(dud, patientstatus.toLowerCase());
  }

  placeAppoinment(Map appoinmentData, var doctorData, patienData,
      List<Object> filesData, BuildContext context) async {
    cerculerShowDialog(context);
    await AddPatient.placeAppoinment(appoinmentData, filesData);

    String repmsg = AddPatient.repmsg;
    if (repmsg == "success") {
      showCustomSnackBarsuccess('Your appoinment has been placed', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.doctorappoinmentlist);
    } else if (AddPatient.repmsg.toString() == "exist" && patienData == null) {
      showCustomSnackBar('You already have an appoinment!!', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.doctorappoinmentlist);
    } else if (patienData == null) {
      showCustomSnackBar('Somthing went wrong!!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AppoinmentPreview(
                  doctorData, patienData, appoinmentData, filesData)));
    } else {
      showCustomSnackBar('Somthing went wrong!!', context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShecdulePage(doctorData, patienData)),
      );
    }
  }

  placeAppoinmentself(Map appoinmentData, var doctorData, patienData,
      List<Object> filesData, BuildContext context) async {
    cerculerShowDialog(context);
    await AddPatient.placeAppoinment(appoinmentData, filesData);

    String repmsg = AddPatient.repmsg;
    if (repmsg == "success") {
      showCustomSnackBarsuccess('Your appoinment has been placed', context);
      Navigator.of(context).popAndPushNamed(RouteManeger.doctorappoinmentlist);
    } else if (AddPatient.repmsg.toString() == "exist" && patienData == null) {
      showCustomSnackBar('You already have an appoinment!!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelfAppoinPreview(
                  doctorData, patienData, appoinmentData, filesData)));
    } else if (patienData == null) {
      showCustomSnackBar('Somthing went wrong!!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelfAppoinPreview(
                  doctorData, patienData, appoinmentData, filesData)));
    } else {
      showCustomSnackBar('Somthing went wrong!!', context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShecdulePage(doctorData, patienData)),
      );
    }
  }
}
