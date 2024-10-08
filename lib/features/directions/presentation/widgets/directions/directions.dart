// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route_direction.dart';
import 'package:app/features/directions/presentation/widgets/directions/end.dart';
import 'package:app/features/directions/presentation/widgets/directions/interchange.dart';
import 'package:app/features/directions/presentation/widgets/directions/start.dart';
import 'package:app/features/directions/presentation/widgets/directions/transit.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MetroDirections extends StatefulWidget {
  final String routeCost;
  final String destination;
  final List<MetroDirection> directions;
  final String fromDistance;
  final String toDistance;
  final DestMetro destMetro;
  final Mixpanel mixpanel;
  final UserPriorityStatus priority;
  final bool isHindi;
  const MetroDirections(
      {super.key,
      required this.mixpanel,
      required this.routeCost,
      required this.fromDistance,
      required this.toDistance,
      required this.destMetro,
      required this.destination,
      required this.directions,
      required this.priority,
      required this.isHindi
      });

  @override
  State<MetroDirections> createState() => _MetroDirectionsState();
}

class _MetroDirectionsState extends State<MetroDirections> {
  @override
  void initState() {
    super.initState();
  }

  String? selectedValue;

  getNativeLineName(String line){
    if(line == "Red Line"){
      return "रेड लाइन";
    }else if(line == "Yellow Line"){
      return "येलो लाइन";
    }else if(line == "Blue Line"){
      return "ब्लू लाइन";
    }else if(line == "Blue Line - Branch"){
      return "ब्लू लाइन - रैन्च";
    }else if(line == "Green Line"){
      return "ग्रीन लाइन";
    }else if(line == "Violet Line"){
      return "वॉयलेट लाइन";
    }else if(line == "Pink Line"){
      return "पिंक लाइन";
    }else if(line == "Magenta Line"){
      return "मेजेंटा लाइन";
    }else if(line == "Grey Line"){
      return "ग्रे लाइन";
    }else if(line == "Airport Express - Orange Line"){
      return "एयरपोर्ट एक्सप्रेस - ऑरेंज लाइन";
    }else if(line == "Rapid Metro - RMGL"){
      return "रैपिड मेट्रो - आरएमजीएल";
    }else if(line == "Aqua Line"){
      return "अक्वा लाइन";
    }
  }

  formatDirection(MetroDirection direction, List<MetroDirection> directions) {
    int dirIndex = directions.indexOf(direction);
    if (direction.travelMode == "WALKING" &&
        direction.vehicleType == "BRIDGE") {
      MetroDirection prevDir = directions[dirIndex - 1];
      bool isBridgeEnd = false;
      if (direction.arrivalName == direction.departureName) {
        isBridgeEnd = true;
      }


      String header = widget.isHindi?"यहां बदलें using FOB":"Change lines using FOB";
      String currName = direction.arrivalName;

      if(widget.isHindi){
        for(int i=0; i<prevDir.stations.length; i++){
          if(prevDir.stations[i]==currName){
            currName = prevDir.stations[i]["native_name"];
          }
        }
      }

      
      return DirectionInter(
          isBridge: true,
          isBridgeEnd: isBridgeEnd,
          isHindi: widget.isHindi,
          header: header,
          newStation: direction.arrivalName,
          interchangeStation: direction.interchange,
          prevLine: prevDir.currLineName,
          prevLineColor: prevDir.currLineColour,
          currLine: direction.currLineName,
          currLineColor: direction.currLineColour);
    }
    if (direction.travelMode == "WALKING" && (dirIndex == 0)) {
      //MetroDirection nextDir = directions[dirIndex + 1];
      return DirectionStart(
        mixpanel:widget.mixpanel,
        fromStation: direction.arrivalName,
        fromName: direction.departureName,
      );
    }
    if (direction.travelMode == "WALKING" &&
        (dirIndex == directions.length - 1)) {
      //MetroDirection nextDir = directions[dirIndex + 1];
      return DirectionEnd(
        mixpanel:widget.mixpanel,
        toStation: direction.departureName,
        toName: direction.arrivalName,
      );
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
      bool isBridgeEnd = false;
      if (prevName == currName) {
        header = widget.isHindi?"यहां बदलें":"Change here";
      } else {
        isBridge = true;
        header = widget.isHindi?"यहां बदलें using FOB":"Change here using FOB";
      }

      if(widget.isHindi){
        for(int i=0; i<currDir.stations.length; i++){
          if(currDir.stations[i]==currName){
            currName = currDir.stations[i]["native_name"];
          }
        }
        currLine = getNativeLineName(currLine);
      }

      return DirectionInter(
          newStation: currName,
          isHindi: widget.isHindi,
          isBridge: isBridge,
          header: header,
          interchangeStation: direction.interchange,
          prevLine: prevLine,
          prevLineColor: prevLineColor,
          currLine: currLine,
          isBridgeEnd: isBridgeEnd,
          currLineColor: currLineColor);
    }

    if (direction.travelMode == "TRANSIT") {
      //Filter Stations
      List<dynamic> filteredStations = [];
      int startIndex = 0;
      int endIndex = 0;
      filteredStations = direction.stations.sublist(startIndex, endIndex);
      int i = 0;
      String transitDeparture = "";
      String transitArrival = "";
      String transitHeadsign = "";
      String transitPlatform = "";

      transitPlatform = direction.platform;
      if(widget.isHindi){
       transitPlatform = transitPlatform.replaceAll("Platform","प्लेटफार्म नंबर");
      }
      for (var element in direction.stations) {
        if (element["name"] == direction.departureName) {
          startIndex = i;
          transitDeparture = element[widget.isHindi?"native_name":"name"];
        } else if (element["name"] == direction.arrivalName) {
          endIndex = i;
          transitArrival = element[widget.isHindi?"native_name":"name"];
        } else if (element["name"] == direction.headsign) {
          transitHeadsign = element[widget.isHindi?"native_name":"name"];
        }
        i++;
      }
      if (startIndex < endIndex) {
        filteredStations =
            direction.stations.sublist(startIndex, endIndex + 1).toList();
      } else {
        filteredStations =
            direction.stations.sublist(endIndex, startIndex + 1).toList();
      }
      filteredStations.remove(filteredStations.first);
      filteredStations.remove(filteredStations.last);

      return DirectionTransit(
          isHindi: widget.isHindi,
          platform: transitPlatform, // direction.platform,
          stops: direction.stops,
          duration: direction.duration,
          headsign: transitHeadsign, // direction.headsign,
          departure: transitDeparture,// direction.departureName,
          arrival: transitArrival, // direction.arrivalName,
          currLine: direction.currLineName,
          stations: filteredStations,
          lineColor: direction.currLineColour);
    }
  }

  getCarouselIcons(int step, int totalDirections) {
    List<Widget> icons = [];
    for (double i = 0; i < totalDirections; i++) {
      Color defColor = const Color(0xff000000);
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
            color: const Color(0xff000000).withOpacity(0.4),
          ),
        );
      }
    }
    return icons;
  }

  // getInstructions(int step, List<MetroDirection> directions) {
  //   MetroDirection direction = directions[step.toInt()];

  //   if (direction.travelMode == "WALKING" &&
  //       direction.vehicleType == "BRIDGE") {
  //     MetroDirection prevDir = directions[step.toInt() - 1];
  //     String prevName = prevDir.arrivalName;
  //     String prevLine = prevDir.currLineName;

  //     return InterInstruction(
  //       currStation: direction.arrivalName,
  //       isBridge: true,
  //       interchange: prevName,
  //       prevLine: prevLine.toLowerCase(),
  //       currLine: direction.currLineName.toLowerCase(),
  //       //bannerAd: bannerAd,
  //     );
  //   }
  //   if (direction.travelMode == "WALKING" && step == 0) {
  //     String firstStation = directions[1].departureName;
  //     return StartInstruction(
  //       station: firstStation, //direction.departureName
  //       distance: widget.fromDistance,
  //       //bannerAd: bannerAd,
  //     );
  //   }
  //   if (direction.travelMode == "WALKING" &&
  //       step != directions.length &&
  //       step != 0) {
  //     MetroDirection prevDir = directions[step.toInt() - 1];
  //     String prevName = prevDir.arrivalName;
  //     MetroDirection nextDir = directions[step.toInt() + 1];
  //     String currName = nextDir.departureName;
  //     String prevLine = prevDir.currLineName;
  //     String currLine = nextDir.currLineName;
  //     String interStation = direction.interchange;
  //     bool isBridge = false;
  //     if (prevName != currName) {
  //       isBridge = true;
  //     } else {
  //       currName = "";
  //     }
  //     return InterInstruction(
  //       currStation: currName,
  //       isBridge: isBridge,
  //       interchange: interStation,
  //       prevLine: prevLine.toLowerCase(),
  //       currLine: currLine.toLowerCase(),
  //       //bannerAd: bannerAd,
  //     );
  //   }

  //   if (direction.travelMode == "TRANSIT") {
  //     String arrStation = direction.arrivalName;
  //     String depStation = direction.departureName;
  //     String duration = direction.duration;
  //     int colourCode = direction.currLineColour;
  //     String lineName = direction.currLineName;
  //     List stations = direction.stations;

  //     if (stations.isEmpty == true) {
  //       return TransitInstruction(
  //           headsign: direction.headsign,
  //           depStation: depStation,
  //           arrStation: arrStation,
  //           duration: duration);
  //     } else {
  //       return MetroLine(
  //         stationsData: stations,
  //         lineName: lineName,
  //         colourCode: colourCode,
  //         departure: depStation,
  //         arrival: arrStation,
  //       );
  //     }
  //     // return Text(
  //     //   "Get in the metro rail heading towards ${directions[step.toInt()]["transit_details"]["headsign"]} from $depStation and travel to $arrStation, which would take $duration to reach.",
  //     //   style: TextStyle(fontSize: 18),
  //     //   textAlign: TextAlign.center,
  //     // );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> i = ValueNotifier<int>(0);

    selectedValue = widget.priority == UserPriorityStatus.stops ? "0" : "1";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: widget.directions
            .map(
              (direction) => SizedBox(
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
            )
            .toList(),
      ),
    );
  }
}
