import 'package:app/features/directions/presentation/widgets/directions/line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionTransit extends StatelessWidget {
  String platform;
  String headsign;
  String departure;
  String arrival;
  String currLine;
  String duration;
  int lineColor;
  List stations;
  int stops;
  bool isHindi;
  DirectionTransit(
      {super.key,
      required this.headsign,
      required this.platform,
      required this.departure,
      required this.arrival,
      required this.currLine,
      required this.lineColor,
      required this.duration,
      required this.stations,
      required this.stops,
      required this.isHindi
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left:10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 4),
                height: 110,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        //color: Colors.black,
                        height: 110,
                        padding: const EdgeInsets.only(top: 10),
                        child: VerticalDivider(
                          color: Color(lineColor),
                          thickness: 8,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 18,
                            color: Color(lineColor),
                            //color: Color(lineColor),
                          ),
                          const Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.white,
                            //color: Color(lineColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    departure,
                    style: GoogleFonts.notoSans(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.all(5),
                    //height: 30,
                    decoration: BoxDecoration(
                      color: Color(lineColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      currLine,
                      style:
                          GoogleFonts.notoSans(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isHindi?
                    "$headsign की ओर"
                    :
                    "Towards $headsign",
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 124, 124, 124),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            size: 18,
                            color: Color.fromARGB(255, 157, 157, 157),
                          ),
                          Text(
                            " ${platform.toString()}",
                            style: GoogleFonts.notoSans(
                                color: const Color.fromARGB(255, 124, 124, 124),
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_subway_outlined,
                            size: 18,
                            color: Color.fromARGB(255, 157, 157, 157),
                          ),
                          Text(
                            " ${stops.toString()} ${isHindi?"स्टॉप":"Stops"}",
                            style: GoogleFonts.notoSans(
                                //fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 157, 157, 157),
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        stations.isNotEmpty
          ? MetroLine(
              isHindi: isHindi,
              stationsData: stations,
              lineName: currLine,
              colourCode: lineColor,
              departure: stations.first[isHindi?"native_name":"name"],
              arrival: stations.last[isHindi?"native_name":"name"],
            ):const SizedBox.shrink()
        ,
        
        Padding(
          padding: const EdgeInsets.only(left:10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 4),
                height: 40,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        //color: Colors.black,
                        height: 40,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: VerticalDivider(
                          color: Color(lineColor),
                          thickness: 8,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 18,
                            color: Color(lineColor),
                            //color: Color(lineColor),
                          ),
                          const Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.white,
                            //color: Color(lineColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                arrival,
                style: GoogleFonts.notoSans(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
