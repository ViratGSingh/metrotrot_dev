import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectionStart extends StatelessWidget {
  String fromStation;
  String fromName;
  Mixpanel mixpanel;
  DirectionStart({super.key,
  required this.mixpanel,
   required this.fromStation, required this.fromName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
              children: [
                      const Icon(
                            Icons.location_on,
                            size: 30,
                            color: Color(0xFFFF1616),
                            //color: Color(lineColor),
                          ),
                      Container(
                        //color: Colors.black,
                        height: 70,
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset("assets/images/dotted_line.png")
                      ),
                        
                    ],
                  ),
              
        SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 2*MediaQuery.of(context).size.width/3,
                child: Text(
                  fromName,
                  style:
                      GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                                            onTap: () async {
                                              mixpanel.track("pressedCheckRouteBtn");
                                              final url =
                                                  'https://www.google.com/maps/dir/?api=1&origin=$fromName&destination=$fromStation Metro Station&travelmode=driving';
                                              await launch(url);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFBB23),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              width: 36,
                                              height: 36,
                                              child: const Icon(Icons.directions,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox.shrink()
            ],
          ),
        ),
      ]),
    );
  }
}
