import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectionEnd extends StatelessWidget {
  String toStation;
  String toName;
  Mixpanel mixpanel;
  DirectionEnd({super.key,required this.mixpanel,  required this.toStation, required this.toName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
              Column(
              children: [
                      Container(
                        //color: Colors.black,
                        height: 70,
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset("assets/images/dotted_line.png")
                      ),
                        
                      const Icon(
                            Icons.location_on,
                            size: 30,
                            color: Color(0xFF004AAD),
                            //color: Color(lineColor),
                          ),
                    ],
                  ),
              
        SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              InkWell(
                                            onTap: () async {
                                              mixpanel.track("pressedCheckRouteBtn");
                                              final url =
                                                  'https://www.google.com/maps/dir/?api=1&origin=$toStation Metro Station&destination=$toName&travelmode=driving';
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
          
              
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: Text(
                  toName,
                  style:
                      GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
