import 'package:digital_sasthoo_user/repository/doctor_appoinment_list.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AppoinmentController extends ControllerMVC {
  pandingAppoinment() async {
    return DoctorAppoinmentService().doctorAppoinmentList();
  }

  cancelAppoinment() async {
    return DoctorAppoinmentService().doctorCancelAppoinmentList();
  }

  compatedAppoinment() async {
    return DoctorAppoinmentService().doctorComplatedAppoinmentList();
  }

  appoinmentDetails(String id) async {
    return DoctorAppoinmentService().appoinmentDetails(id);
  }
}
