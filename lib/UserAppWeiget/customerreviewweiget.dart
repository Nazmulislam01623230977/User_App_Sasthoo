import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModel/customerreviewmodel.dart';

class CustomerReviewWeiget extends StatelessWidget {
  final CustomerReview customar;
  const CustomerReviewWeiget(this.customar);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFffffff), //E9F2F2
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 9,
                offset: Offset(0, 1),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(customar.imageurl),
                      radius: 19.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    child: Text(
                      customar.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 6.0,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      customar.date,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 4.0,
                        color: Color(0xffA8A7A7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: SizedBox(
                width: 170,
                child: Text(
                  customar.massage,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 8.0,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
