import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../apitoken/userinfo.dart';
import '../controller/add_patient_controller.dart';
import '../custom/custom_snackbar.dart';
import '../generated/l10n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

// ignore: must_be_immutable
class EidtNewPatient extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var doctordata;
  var patientdata;

  EidtNewPatient(this.doctordata, this.patientdata, {Key key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _EditNewPatientState createState() => _EditNewPatientState(
        this.doctordata,
        this.patientdata,
      );
}

class _EditNewPatientState extends StateMVC<EidtNewPatient> {
  // ignore: prefer_typing_uninitialized_variables
  DateTime _selectedDate;
  var doctordata;
  var patientdata;
  AddPatientController con;
  _EditNewPatientState(
    this.doctordata,
    this.patientdata,
  ) : super(AddPatientController()) {
    con = controller as AddPatientController;
  }

  // ignore: prefer_typing_uninitialized_variables
  String id;
  String _genderValue;
  String _bloodgroup;
  String _relation;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime _currentdate = DateTime.now();
  var initialDate = DateTime.now();
  String selectdate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (_seldate != null) {
      setState(() {
        _currentdate = _seldate;
        _selectedDate = _seldate;
        dateController.text =
            "${_seldate.day}/${_seldate.month}/${_seldate.year}";
      });
    }
  }

  getpatientdata() {
    id = patientdata.id.toString();
    dateController.text = patientdata.dateOfBirth;
    _genderValue = patientdata.gender;
    _bloodgroup = patientdata.bloodGroup;
    _relation = patientdata.relationshipe;
    fnameController.text = patientdata.firstName;
    lnameController.text = patientdata.lastName;
    weightController.text = patientdata.weight;
    heightController.text = patientdata.height;
    phoneController.text = patientdata.phone;
  }

  addPatient() async {
    if (fnameController.text.isEmpty) {
      showCustomSnackBar('First name con not empty !!', context);
    } else if (lnameController.text.isEmpty) {
      showCustomSnackBar('Last name con not empty !!', context);
    } else if (dateController.text.isEmpty) {
      showCustomSnackBar('Date of birth con not empty !!', context);

      showCustomSnackBar('Year con not empty !!', context);
    } else if (_genderValue == null) {
      showCustomSnackBar('Gender con not empty!!', context);
    } else if (_bloodgroup == null) {
      showCustomSnackBar('Blood group con not empty!!', context);
    } else if (_relation == null) {
      showCustomSnackBar('Relation con not empty !!', context);
    } else if (weightController.text.isEmpty) {
      showCustomSnackBar('Weight con not empty !!', context);
    } else if (heightController.text.isEmpty) {
      showCustomSnackBar('Weight con not empty !!', context);
    } else if (phoneController.text.isEmpty) {
      showCustomSnackBar('Phone number con not empty !!', context);
    } else {
      await GetuserDataFromAPi.getuserdata();
      var editpatientdata = {
        "id": id,
        "first_name": fnameController.text,
        "last_name": lnameController.text,
        "date_of_birth": dateController.text,
        "gender": _genderValue,
        "blood_group": _bloodgroup,
        "weight": weightController.text,
        "height": heightController.text,
        "phone": phoneController.text,
        "relationshipe": _relation
      };
      con.editpatient(doctordata, editpatientdata, patientdata, context);
    }
  }

  @override
  void initState() {
    getpatientdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    S.of(context).docpatient_Addnewpatient,
                    // 'Add New Patient',
                    style: GoogleFonts.raleway(
                      fontSize: 20.sp,
                      color: const Color(0xff128041),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                buildFiratname(fnameController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildlastname(lnameController, context),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Gender',
                      S.of(context).reg_gender,
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF), //E9F2F2
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: _genderValue == null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    'Gender*',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    _genderValue,
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                          isExpanded: true,
                          iconSize: 25.h,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          items: ['Male', 'Female', 'Others'].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _genderValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF), //E9F2F2
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'dd/mm/yyyy',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          errorStyle: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.green),
                              onPressed: () {
                                setState(() {
                                  _selectDate(context);
                                });
                              })),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).reg_blood,
                      // " Blood Group",
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF), //E9F2F2
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: _bloodgroup == null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    'Blood Group*',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    _bloodgroup,
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                          isExpanded: true,
                          iconSize: 25.h,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          items: [
                            'AB ',
                            'AB-',
                            'A+',
                            'A-',
                            'B-',
                            'B+',
                            'O+',
                            'O-',
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _bloodgroup = val;
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                buildweiget(weightController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildheiget(heightController, context),
                SizedBox(
                  height: 5.h,
                ),
                buildphone(phoneController, context),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).relation_of_you,
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF), //E9F2F2
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: _relation == null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    //  S.of(context).relation_of_you,
                                    'Relation with you',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Text(
                                    _relation,
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                          isExpanded: true,
                          iconSize: 25.h,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          items: [
                            'Brother ',
                            'Sister',
                            'Father',
                            'Mother',
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _relation = val;
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 50.w, right: 50.w, bottom: 10.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.r), // <-- Radius
                        ),
                        primary: const Color(0xff128041), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () => addPatient(),
                      //  if()

                      // Navigator.of(context).popAndPushNamed(
                      //     RouteManeger.patientappoinment_page);

                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).add_to_patient_list,
                              // 'Add to patient list',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 255, 249, 249),
                                  fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFiratname(fnameController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).reg_fname,
        // "First Name",
        style: GoogleFonts.roboto(
          fontSize: 12.sp,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: 52.h,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: TextFormField(
            controller: fnameController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "nazmul",
              hintStyle: GoogleFonts.roboto(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
            ), //A7ADBC
          ),
        ),
      )
    ],
  );
}

Widget buildlastname(lnameController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).reg_lname,
        // 'Last Name',
        style: GoogleFonts.roboto(
          fontSize: 12.sp,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: 52.h,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: TextFormField(
            controller: lnameController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'islaam',
              hintStyle: GoogleFonts.roboto(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
            ), //A7ADBC
          ),
        ),
      )
    ],
  );
}

Widget buildweiget(weigetController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).patient_weiget,
        // 'Weight ',
        style: GoogleFonts.roboto(
          fontSize: 12.sp,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: 52.h,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
          child: TextFormField(
            controller: weigetController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '72',
              hintStyle: GoogleFonts.roboto(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
            ), //A7ADBC
          ),
        ),
      )
    ],
  );
}

Widget buildheiget(heiigetController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).patient_heiget,
        // 'Height',
        style: GoogleFonts.roboto(
          fontSize: 12.sp,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: 52.h,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: TextFormField(
            controller: heiigetController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '8.2',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                )), //A7ADBC
          ),
        ),
      )
    ],
  );
}

Widget buildphone(phoneController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).phn_num,
        style: GoogleFonts.roboto(
          fontSize: 12.sp,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: 52.h,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF), //E9F2F2
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '01XXXXXXXXX',
              hintStyle: GoogleFonts.roboto(
                fontSize: 12.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
            ), //A7ADBC
          ),
        ),
      )
    ],
  );
}

Widget buildpassword(emailController, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).reg_password,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Roboto',
          color: Color.fromARGB(255, 5, 5, 5),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
