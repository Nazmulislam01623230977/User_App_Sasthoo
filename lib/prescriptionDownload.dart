import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class prescriptionDownload extends StatefulWidget {
  IconData icon;
  String name;
  // IconData icon;
  // String name;
  prescriptionDownload({Key key, this.icon, this.name}) : super(key: key);

  @override
  State<prescriptionDownload> createState() => _prescriptionDownloadState();
}

// ignore: camel_case_types
class _prescriptionDownloadState extends State<prescriptionDownload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xffffffff), //E9F2F2
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(widget.icon),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0088A6)),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                openFile() {
                  Url:
                  'https://cdn.pixabay.com/photo/2016/02/28/12/55/boy-1226964_960_720.jpg';
                  fileName:
                  'picture';
                }
              },
              child: Text('(clict to download)',
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFF8585)))),
          Divider(
            color: Color(
              (0xffE5E5E5),
            ),
            thickness: .05,
          )
        ],
      ),
    );
  }
  // Future openFile({ String Url,String name })async {
  //   await downloadFile()
  // }
}
