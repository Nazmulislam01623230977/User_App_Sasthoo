import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../api/apiurl.dart';
import '../models/doctor_cancel_appoinment_list.dart';

class CancelAppoinmentList extends StatefulWidget {
  DoctorCancelAppoinmentForUser cancelDotorAppoinment;
  CancelAppoinmentList({Key key, this.cancelDotorAppoinment}) : super(key: key);
  @override
  _CancelAppoinmentListState createState() => _CancelAppoinmentListState();
}

class _CancelAppoinmentListState extends State<CancelAppoinmentList> {
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 9, left: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat("dd.MM.yyyy").format(
                            widget.cancelDotorAppoinment.appointmentDate),
                        style: GoogleFonts.ubuntu(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          DateFormat("h:mma")
                              .format(widget.cancelDotorAppoinment.sheduleTime),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.cancelDotorAppoinment.fee + " Tk",
                    style: GoogleFonts.ubuntu(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(Baseurl.mainurl +
                          "/" +
                          widget.cancelDotorAppoinment.doctorPhotos.avater),
                      radius: 20.0,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 250,
                            child: Text(
                              widget.cancelDotorAppoinment.doctors.firstName +
                                  " " +
                                  widget.cancelDotorAppoinment.doctors.lastName,
                              style: GoogleFonts.ubuntu(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 250,
                            child: widget
                                        .cancelDotorAppoinment.patientDetails !=
                                    null
                                ? Text(
                                    "Patient Name: " +
                                        widget.cancelDotorAppoinment
                                            .patientDetails.firstName +
                                        " " +
                                        widget.cancelDotorAppoinment
                                            .patientDetails.lastName,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12.0,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 250,
                            child: widget
                                        .cancelDotorAppoinment.patientDetails !=
                                    null
                                ? Text(
                                    "Phone no: " +
                                        widget.cancelDotorAppoinment
                                            .patientDetails.phone,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12.0,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 250,
                            child: widget
                                        .cancelDotorAppoinment.patientDetails !=
                                    null
                                ? Text(
                                    "Gender: " +
                                        widget.cancelDotorAppoinment
                                            .patientDetails.gender,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12.0,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 250,
                            child: widget
                                        .cancelDotorAppoinment.patientDetails !=
                                    null
                                ? Text(
                                    "Gender: " +
                                        widget.cancelDotorAppoinment
                                            .patientDetails.bloodGroup,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12.0,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  // IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.video_call)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 23, right: 23),
                child: Divider(color: Color(0xff959595)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "See Shedule",
                      style: GoogleFonts.ubuntu(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'canceled',
                          style: GoogleFonts.ubuntu(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
