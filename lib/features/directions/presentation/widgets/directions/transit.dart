import 'dart:math';
import 'package:app/features/directions/presentation/widgets/directions/line.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

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
  DirectionTransit(
      {Key? key,
      required this.headsign,
      required this.platform,
      required this.departure,
      required this.arrival,
      required this.currLine,
      required this.lineColor,
      required this.duration,
      required this.stations,
      required this.stops})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 4),
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
                      padding: EdgeInsets.only(top: 10),
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
                        Icon(
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
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(5),
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
                SizedBox(height: 2),
                Text(
                  "Towards $headsign",
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    color: Color.fromARGB(255, 124, 124, 124),
                  ),
                ),
                SizedBox(
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
                              color: Color.fromARGB(255, 124, 124, 124),
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.directions_subway_outlined,
                          size: 18,
                          color: Color.fromARGB(255, 157, 157, 157),
                        ),
                        Text(
                          " ${stops.toString()} Stops",
                          style: GoogleFonts.notoSans(
                              //fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 157, 157, 157),
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
        MetroLine(
          stationsData: stations.sublist(2, stations.length - 1),
          lineName: currLine,
          colourCode: lineColor,
          departure: stations.sublist(1, stations.length - 1).first["name"],
          arrival: stations.sublist(1, stations.length - 1).last["name"],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 0, right: 4),
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
                      padding: EdgeInsets.only(bottom: 10),
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
                        Icon(
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
      ]),
    );
  }
}
