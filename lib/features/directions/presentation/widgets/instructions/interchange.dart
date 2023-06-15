import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterInstruction extends StatelessWidget {
  String interchange;
  String prevLine;
  String currLine;
  bool isBridge;
  String? currStation;
  //BannerAd? bannerAd;
  InterInstruction({
    Key? key,
    required this.interchange,
    required this.prevLine,
    required this.currLine,
    required this.isBridge,
    this.currStation
    //this.bannerAd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Instruction", style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: isBridge==false?"From $interchange, change lines from ":"From $interchange, use the follow on bridge (FOB) to go to $currStation and change lines from ",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "$prevLine",
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " to ",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "$currLine",
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ".",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
              ]),
            ),
            // bannerAd != null
            //     ? Container(
            //         height: 72,
            //         alignment: Alignment.center,
            //         child: AdWidget(ad: bannerAd!),
            //       )
            //     : SizedBox.shrink()
          ],
        ));
  }
}
