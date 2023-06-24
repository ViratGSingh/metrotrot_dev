// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route_direction.dart';
import 'package:app/features/directions/presentation/widgets/directions/end.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
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
  final UserPriorityStatus priority;
  const MetroDirections(
      {Key? key,
      required this.routeCost,
      required this.fromDistance,
      required this.toDistance,
      required this.destMetro,
      required this.destination,
      required this.directions,
      required this.priority})
      : super(key: key);

  @override
  State<MetroDirections> createState() => _MetroDirectionsState();
}

class _MetroDirectionsState extends State<MetroDirections> {
  @override
  void initState() {
    super.initState();
  }

  String? selectedValue;
  formatDirection(MetroDirection direction, List<MetroDirection> directions) {
    int dirIndex = directions.indexOf(direction);
    if (direction.travelMode == "WALKING" &&
        direction.vehicleType == "BRIDGE") {
      MetroDirection prevDir = directions[dirIndex - 1];

      String header = "Change lines using FOB";
      return DirectionInter(
          isBridge: true,
          header: header,
          newStation: direction.arrivalName,
          interchangeStation: direction.interchange,
          prevLine: prevDir.currLineName,
          prevLineColor: prevDir.currLineColour,
          currLine: direction.currLineName,
          currLineColor: direction.currLineColour);
    }
    if (direction.travelMode == "WALKING" && dirIndex == 0) {
      MetroDirection nextDir = directions[dirIndex + 1];
      return DirectionStart(fromStation: nextDir.departureName);
    }
    if (direction.travelMode == "WALKING" &&
        dirIndex != directions.length &&
        dirIndex != 0) {
      MetroDirection prevDir = directions[dirIndex - 1];
      String prevName = prevDir.arrivalName;

      MetroDirection currDir = directions[dirIndex + 1];
      String currName = currDir.departureName;

      int prevLineColor = prevDir.currLineColour;
      int currLineColor = currDir.currLineColour;
      String prevLine = prevDir.currLineName;
      String currLine = currDir.currLineName;
      String header = "";
      bool isBridge = false;
      if (prevName == currName) {
        header = "Change lines in";
      } else {
        isBridge = true;
        header = "Change lines using FOB";;
      }

      return DirectionInter(
          newStation: currName,
          isBridge: isBridge,
          header: header,
          interchangeStation: direction.interchange,
          prevLine: prevLine,
          prevLineColor: prevLineColor,
          currLine: currLine,
          currLineColor: currLineColor);
    }

    if (direction.travelMode == "TRANSIT") {
      return DirectionTransit(
          platform: direction.platform,
          stops: direction.stops,
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
    if (direction.travelMode == "WALKING" &&
        direction.vehicleType == "BRIDGE") {
      MetroDirection prevDir = directions[step.toInt() - 1];
      String prevName = prevDir.arrivalName;
      String prevLine = prevDir.currLineName;

      return InterInstruction(
        currStation: direction.arrivalName,
        isBridge: true,
        interchange: prevName,
        prevLine: prevLine.toLowerCase(),
        currLine: direction.currLineName.toLowerCase(),
        //bannerAd: bannerAd,
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
      String prevName = prevDir.arrivalName;
      MetroDirection nextDir = directions[step.toInt() + 1];
      String currName = nextDir.departureName;
      String prevLine = prevDir.currLineName;
      String currLine = nextDir.currLineName;
      String interStation = direction.interchange;
      bool isBridge = false;
      if (prevName != currName) {
        isBridge = true;
      } else {
        currName = "";
      }
      return InterInstruction(
        currStation: currName,
        isBridge: isBridge,
        interchange: interStation,
        prevLine: prevLine.toLowerCase(),
        currLine: currLine.toLowerCase(),
        //bannerAd: bannerAd,
      );
    }

    if (direction.travelMode == "TRANSIT") {
      String arrStation = direction.arrivalName;
      String depStation = direction.departureName;
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
          stationsData: stations,
          lineName: lineName,
          colourCode: colourCode,
          departure: depStation,
          arrival: arrStation,
        );
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
    selectedValue =  widget.priority==UserPriorityStatus.stops?"0":"1";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Padding(
        //   padding: EdgeInsets.fromLTRB(40, 0, 40, 5),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //           padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10),
        //               boxShadow: [
        //                 BoxShadow(
        //                   offset: Offset(0, 4),
        //                   blurRadius: 4,
        //                   color: Colors.black.withOpacity(0.25),
        //                 )
        //               ]),
        //           child: RichText(
        //             text: TextSpan(children: [
        //               TextSpan(
        //                 text: "Trip Fare: ",
        //                 style: GoogleFonts.notoSans(
        //                     fontSize: 16,
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               TextSpan(
        //                 text: widget.routeCost,
        //                 style: GoogleFonts.notoSans(
        //                   fontSize: 16,
        //                   color: Colors.black,
        //                 ),
        //               )
        //             ]),
        //           )),
        //       DropdownButton2(
        //         hint: Text(
        //           "User Priority",
        //           style: GoogleFonts.notoSans(
        //               fontSize: 14,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         autofocus: true,
        //         value: selectedValue,

        //         isExpanded: true,

        //         buttonStyleData: ButtonStyleData(
        //           padding: EdgeInsets.only(left: 10),
        //           width: MediaQuery.of(context).size.width / 3,
        //           height: 40,
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10),
        //               boxShadow: [
        //                 BoxShadow(
        //                   offset: Offset(0, 4),
        //                   blurRadius: 4,
        //                   color: Colors.black.withOpacity(0.25),
        //                 )
        //               ]),
        //         ),
        //         iconStyleData: IconStyleData(
        //           iconEnabledColor: Color(0xffFFBB23),
        //         ),
        //         onChanged: (value) {
        //           if(value=="0"){
                    
        //           }else if(value=="1"){

        //           }
        //         },
        //         items: [
        //           DropdownMenuItem<String>(
        //             value: "0",
        //             child: Text(
        //               "Less Walking",
        //               style: GoogleFonts.notoSans(
        //                 fontSize: 14,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ),
        //           DropdownMenuItem<String>(
        //             value: "1",
        //             child: Text(
        //               "Less Stations",
        //               style: GoogleFonts.notoSans(
        //                 fontSize: 14,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ),
        //         ],

        //         //  Container(
        //         //   width: 40,
        //         //       height: 40,
        //         //       decoration: BoxDecoration(
        //         //           color: Color(0xffFFBB23),
        //         //           borderRadius: BorderRadius.circular(10),
        //         //           boxShadow: [
        //         //             BoxShadow(
        //         //               offset: Offset(0, 4),
        //         //               blurRadius: 4,
        //         //               color: Colors.black.withOpacity(0.25),
        //         //             )
        //         //           ]),
        //         //       child:
        //         //           Icon(Icons.tune, color: Colors.white, size: 24,),
        //         //           ),
        //       ),
        //     ],
        //   ),
        // ),
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
