import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransitInstruction extends StatelessWidget {
  String headsign;
  String depStation;
  String arrStation;
  String duration;
  TransitInstruction({
    Key? key,
    required this.headsign,
    required this.depStation,
    required this.arrStation,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final c = Get.put(
    //   HomeController(),
    // );
    int i = 0;
    bool isEnd = false;
    List data = [];

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Get in the metro rail heading towards $headsign from ",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "$depStation",
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " and travel to ",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "$arrStation",
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ", which would take ",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "$duration",
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " to reach.",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
              ]),
            ),
          ],
        ));
  }
}
