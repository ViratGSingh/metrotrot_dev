import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionStart extends StatelessWidget {
  String fromStation;
  DirectionStart({Key? key, required this.fromStation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Start from",
          style: GoogleFonts.notoSans(fontSize: 16),
        ),
        Text(
          fromStation,
          style:
              GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
