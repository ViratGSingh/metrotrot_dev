import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionInter extends StatelessWidget {
  String interchangeStation;
  String prevLine;
  int prevLineColor;
  String currLine;
  int currLineColor;
  DirectionInter(
      {Key? key,
      required this.interchangeStation,
      required this.prevLine,
      required this.prevLineColor,
      required this.currLine,
      required this.currLineColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/interchange.png"),
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
        Text("Change lines in", style: GoogleFonts.notoSans(fontSize: 16)),
        Text(
          interchangeStation,
          style:
              GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 30,
            decoration: BoxDecoration(
              color: Color(prevLineColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              prevLine,
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          height: 50,
          width: 20,
          child: Image.asset(
            "assets/images/dotted_line.png",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 30,
            decoration: BoxDecoration(
              color: Color(currLineColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              currLine,
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
