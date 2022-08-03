import 'package:flutter/material.dart';

import '../Route/route.dart';
import '../api/apiurl.dart';
import '../models/doctorlist_models.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SpecialityDoctorList extends StatefulWidget {
  DoctorList topDoctorlist;

  SpecialityDoctorList({Key key, this.topDoctorlist}) : super(key: key);

  @override
  _SpecialityDoctorListState createState() => _SpecialityDoctorListState();
}

class _SpecialityDoctorListState extends State<SpecialityDoctorList> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF), //E9F2F2
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
              RouteManeger.doctorprofile_page,
              arguments: (widget.topDoctorlist));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: widget.topDoctorlist.userPhotos.isNotEmpty
                  ? Column(
                      children: List.generate(
                          widget.topDoctorlist.userPhotos.length, (index) {
                      var imagephoto = widget.topDoctorlist.userPhotos.last;

                      return CircleAvatar(
                        backgroundImage: NetworkImage(
                            Baseurl.mainurl + "/" + imagephoto.avater),
                        radius: 35,
                      );
                    }))
                  : Column(children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/fonts/images/noimage.png'),
                        radius: 45,
                      )
                    ]),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.topDoctorlist.firstName +
                        widget.topDoctorlist.lastName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  Row(
                      children: List.generate(
                          widget.topDoctorlist.educationExpriance.length,
                          (index) {
                    return Text(
                      widget.topDoctorlist.educationExpriance[index]
                              .examination +
                          "," +
                          "\n" +
                          "||" +
                          widget.topDoctorlist.educationExpriance[index]
                              .instituteName +
                          "\n",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    );
                  })),
                  Row(
                      children: List.generate(
                          widget.topDoctorlist.doctorSpeciality.length,
                          (index) {
                    var speciality = widget.topDoctorlist.doctorSpeciality.last;

                    return Text(
                      speciality.specialitie,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    );
                  })),

                  RatingBar.builder(
                      itemSize: 12,
                      minRating: 1,
                      itemBuilder: (_, context) =>
                          const Icon(Icons.star, color: Colors.yellow),
                      onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          })),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * .15,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Icon(
                  //         Icons.star,
                  //         size: 12,
                  //         color: Colors.yellow,
                  //       ),
                  //       const Icon(Icons.star, size: 12, color: Colors.yellow),
                  //       const Icon(Icons.star, size: 12, color: Colors.yellow),
                  //       const Icon(Icons.star, size: 12, color: Colors.yellow),
                  //       const Icon(Icons.star, size: 12, color: Colors.yellow),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
