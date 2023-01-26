import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class StartInstruction extends GetView {
  String station;
  String distance;
  BannerAd? bannerAd;
  StartInstruction(
      {Key? key, required this.station, required this.distance, this.bannerAd})
      : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text:
                        "Head towards the nearest metro station $station which is ",
                    style:
                        GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                  ),
                  TextSpan(
                    text: "$distance metres",
                    style: GoogleFonts.notoSans(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " away from your location.",
                    style:
                        GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                  ),
                ]),
              ),
              bannerAd != null
                  ? Container(
                      width: bannerAd!.size.width.toDouble(),
                      height: 72,
                      alignment: Alignment.center,
                      child: AdWidget(ad: bannerAd!),
                    )
                  : SizedBox.shrink()
            ]));
  }
}
