import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionEnd extends GetView {
  String toStation;
  DirectionEnd({Key? key, required this.toStation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/destination.png"),
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
          "Head towards",
          style: GoogleFonts.notoSans(fontSize: 16),
        ),
        Text(
          toStation,
          style:
              GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
