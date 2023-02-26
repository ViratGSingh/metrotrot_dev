// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route_direction.dart';
import 'package:app/features/directions/presentation/widgets/directions/end.dart';
import 'package:app/features/directions/presentation/widgets/directions/interchange.dart';
import 'package:app/features/directions/presentation/widgets/directions/line.dart';
import 'package:app/features/directions/presentation/widgets/directions/start.dart';
import 'package:app/features/directions/presentation/widgets/directions/transit.dart';
import 'package:app/features/directions/presentation/widgets/instructions/end.dart';
import 'package:app/features/directions/presentation/widgets/instructions/interchange.dart';
import 'package:app/features/directions/presentation/widgets/instructions/start.dart';
import 'package:app/features/directions/presentation/widgets/instructions/transit.dart';

class MetroDirections extends StatefulWidget {
  final String routeCost;
  final String destination;
  final List<MetroDirection> directions;
  final String fromDistance;
  final String toDistance;
  final DestMetro destMetro;
  const MetroDirections({
    Key? key,
    required this.routeCost,
    required this.fromDistance,
    required this.toDistance,
    required this.destMetro,
    required this.destination,
    required this.directions,
  }) : super(key: key);

  @override
  State<MetroDirections> createState() => _MetroDirectionsState();
}

class _MetroDirectionsState extends State<MetroDirections> {
  @override
  void initState() {
    super.initState();
  }

  formatDirection(MetroDirection direction, List<MetroDirection> directions) {
    int dirIndex = directions.indexOf(direction);
    if (direction.travelMode == "WALKING" &&
        dirIndex == directions.length - 1) {
      //MetroDirection prevDir = directions[dirIndex - 1];
      return DirectionEnd(toStation: widget.destination);
    }
    if (direction.travelMode == "WALKING" && dirIndex == 0) {
      MetroDirection nextDir = directions[dirIndex + 1];
      return DirectionStart(fromStation: nextDir.departureName);
    }
    if (direction.travelMode == "WALKING" &&
        dirIndex != directions.length &&
        dirIndex != 0) {
      MetroDirection prevDir = directions[dirIndex - 1];
      MetroDirection currDir = directions[dirIndex + 1];
      int prevLineColor = prevDir.currLineColour;
      int currLineColor = currDir.currLineColour;
      String prevLine = prevDir.currLineName;
      String currLine = currDir.currLineName;

      return DirectionInter(
          interchangeStation: direction.interchange,
          prevLine: prevLine,
          prevLineColor: prevLineColor,
          currLine: currLine,
          currLineColor: currLineColor);
    }

    if (direction.travelMode == "TRANSIT") {
      return DirectionTransit(
          duration: direction.duration,
          headsign: direction.headsign,
          departure: direction.departureName,
          arrival: direction.arrivalName,
          currLine: direction.currLineName,
          stations: direction.stations,
          lineColor: direction.currLineColour);
    }
  }

  getCarouselIcons(int step, int totalDirections) {
    List<Widget> icons = [];
    for (double i = 0; i < totalDirections; i++) {
      Color defColor = Color(0xff000000);
      int defSize = 10;
      if (i == step) {
        icons.add(
          const Icon(
            Icons.circle,
            size: 14,
            color: Color(0xffFFBB23),
          ),
        );
      } else {
        icons.add(
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xff000000).withOpacity(0.4),
          ),
        );
      }
    }
    return icons;
  }

  getInstructions(int step, List<MetroDirection> directions) {
    MetroDirection direction = directions[step.toInt()];
    if (direction.travelMode == "WALKING" && step == directions.length - 1) {
      String lastStation = directions[step.toInt() - 1].arrivalName;
      return EndInstruction(
        station: lastStation,
        distance: widget.toDistance,
        //bannerAd: bannerAd
      );
    }
    if (direction.travelMode == "WALKING" && step == 0) {
      String firstStation = directions[1].departureName;
      return StartInstruction(
        station: firstStation, //direction.departureName
        distance: widget.fromDistance,
        //bannerAd: bannerAd,
      );
    }
    if (direction.travelMode == "WALKING" &&
        step != directions.length &&
        step != 0) {
      MetroDirection prevDir = directions[step.toInt() - 1];
      MetroDirection nextDir = directions[step.toInt() + 1];
      String prevLine = prevDir.currLineName;
      String currLine = nextDir.currLineName;
      String interStation = direction.interchange;
      return InterInstruction(
        interchange: interStation,
        prevLine: prevLine.toLowerCase(),
        currLine: currLine.toLowerCase(),
        //bannerAd: bannerAd,
      );
    }

    if (direction.travelMode == "TRANSIT") {
      String arrStation = direction.arrivalName;
      String depStation = direction.arrivalName;
      String duration = direction.duration;
      int colourCode = direction.currLineColour;
      String lineName = direction.currLineName;
      List stations = direction.stations;
      if (stations.isEmpty == true) {
        return TransitInstruction(
            headsign: direction.headsign,
            depStation: depStation,
            arrStation: arrStation,
            duration: duration);
      } else {
        return MetroLine(
            stationsData: stations, lineName: lineName, colourCode: colourCode);
      }
      // return Text(
      //   "Get in the metro rail heading towards ${directions[step.toInt()]["transit_details"]["headsign"]} from $depStation and travel to $arrStation, which would take $duration to reach.",
      //   style: TextStyle(fontSize: 18),
      //   textAlign: TextAlign.center,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> i = ValueNotifier<int>(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 0),
          alignment: Alignment.topLeft,
          width: 2 * MediaQuery.of(context).size.width / 3 + 60,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Trip Fare: ",
                    style: GoogleFonts.notoSans(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: widget.routeCost,
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ]),
              )),
        ),
        CarouselSlider(
          items: widget.directions
              .map((direction) => Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         offset: Offset(0, 4),
                        //         blurRadius: 4,
                        //         color: Colors.black.withOpacity(0.25),
                        //       )
                        //     ]),
                        child: formatDirection(
                            direction,
                            widget
                                .directions) //controller.formatDirection(direction),
                        ),
                  ))
              .toList(),
          options: CarouselOptions(
              onPageChanged: ((value, CarouselPageChangedReason) {
                //controller.currentStep.value = value;

                i.value = value;
              }),
              scrollPhysics: BouncingScrollPhysics(),
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height / 2),
        ),
        ValueListenableBuilder(
          valueListenable: i,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getCarouselIcons(i.value, widget.directions.length),
              ),
            );
          },
        ),
        ValueListenableBuilder(
            valueListenable: i,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Container(
                padding: const EdgeInsets.only(top: 30),
                width: 2 * MediaQuery.of(context).size.width / 3 + 60,
                height: MediaQuery.of(context).size.height / 4,
                child: getInstructions(i.value, widget.directions),
              );
            })
      ],
    );
  }
}
