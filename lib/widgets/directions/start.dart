import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionStart extends GetView {
  String fromStation;
  DirectionStart({Key? key, required this.fromStation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/nearest.png"),
              alignment: Alignment.bottomCenter),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            )
          ]),
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
