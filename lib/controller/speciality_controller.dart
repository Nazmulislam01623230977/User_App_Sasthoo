import 'package:mvc_pattern/mvc_pattern.dart';
import '../repository/nearbydoctlist_repository.dart';
import '../repository/speciality_doctor_list_repository.dart';
import '../repository/speciality_repository.dart';

class SpecialityController extends ControllerMVC {
  specialityfunction() async {
    return SpecialiyRepository().getspecialitydata();
  }

  specialityDoctorList(String speaciality) async {
    return SpecialiyDoctorRepository().getspecialityDoctorData(speaciality);
  }

  nearbydoctorlist() async {
    return NearDoctorRepository().getnearbyDoctorData();
  }
}
