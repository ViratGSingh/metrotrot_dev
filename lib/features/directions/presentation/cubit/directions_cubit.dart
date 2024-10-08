import 'dart:math';
import 'dart:convert';
import 'package:app/features/directions/data/models/route_direction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route.dart';
import 'package:app/features/directions/data/repositories/directions_repository.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
part 'directions_state.dart';

class DirectionsCubit extends Cubit<DirectionsState> {
  final DirectionsRepository directionsRepository;
  DirectionsCubit({required this.directionsRepository})
      : super(DirectionsState.initial());

  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    await dotenv.load(fileName: '.env');
    mixpanel = await Mixpanel.init(dotenv.env["MIXPANEL_PROJECT_ID"].toString(),
        trackAutomaticEvents: false);
  }

  getDirections(FromMetro fromMetro, DestMetro toMetro, String destName,
      String destAddress, bool isOffline, UserPriorityStatus priority) async {
    emit(state.copyWith(
        status: DirectionsStatus.loading,
        isOffline: isOffline,
        priority: priority));

    await Future.delayed(
      const Duration(seconds: 1),
    );
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    List<Station> metroStations = [];
    Station? startStation;
    Station? endStation;
    int metroLines = metroData["total_lines"];
    Map<String, List<Station>> graphData = {};
    print("Asdasd1");
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      List<Station> lineStations = [];
      for (var element in lineData) {
        List<dynamic> dynamicLines = element["interchange_data"]["lines"];
        List<String> lines = dynamicLines.map((e) => e.toString()).toList();
        Station stationData = Station(
            id: element["place_id"],
            name: element["name"],
            latitude: element["coordinates"]["lat"],
            longitude: element["coordinates"]["lng"],
            isInterchange: element["is_interchange"],
            isFob: element.containsKey("is_fob") == true ? true : false,
            fobLine: element.containsKey("fob_data") == true
                ? element["fob_data"]["line"]
                : "",
            fobStationIndex: element.containsKey("fob_data") == true
                ? element["fob_data"]["index"]
                : -1,
            lines: lines);
        lineStations.add(stationData);
        if (metroStations.contains(stationData) == false) {
          metroStations.add(stationData);
        }
        if (fromMetro.name == stationData.name) {
          startStation = stationData;
        }
        if (toMetro.name == stationData.name) {
          endStation = stationData;
        }
      }
      graphData["line_${i.toString()}"] = lineStations;
      //metroStations.addAll(lineData);
    }
    //Find Start Station
    MetroRoute route = MetroRoute.initial();
    List<ShortestPathResult> routes = [];

    //Find End Station
    if (startStation != null && endStation != null) {
      Graph metroGraph = createGraphFromJson(
          metroStations,
          graphData,
          Station(
              id: "",
              name: "",
              latitude: 0,
              longitude: 0,
              isInterchange: false,
              lines: []));

      ////print(metroStations.length);
      ShortestPathResult shortestRoute = ShortestPathResult(
        path:[], distance: 0, incursions: [], numInterchanges: 0, route: route);
      if(priority==UserPriorityStatus.interchanges){
         //AltGraph altGraphData = await loadGraphData(metroData);
         shortestRoute = findLeastInterchangePath(metroGraph,startStation,endStation,metroData);
         //findTop10PathsWithUniqueFirstInterchanges(altGraphData, startStation!, endStation!);
      }else{
        shortestRoute =
          findShortestPath(metroGraph, startStation, endStation, metroData);
      }//findMinIntPath(metroGraph, startStation!, endStation!, metroData);
      routes.add(shortestRoute);
      route = shortestRoute.route;
      List<Station> incursions = shortestRoute.incursions;
      ////print("incursions start");
      for (var incursion in incursions) {
        ////print(incursion.name);
        //metroStations.remove(incursion);
        metroGraph = createGraphFromJson(metroStations, graphData, incursion);
        // if (priority == UserPriorityStatus.interchanges) {
        //   shortestRoute =
        //       findMinIntPath(metroGraph, startStation!, endStation!, metroData);
        // }
        //else {
        shortestRoute =
            findShortestPath(metroGraph, startStation, endStation, metroData);
        //}
        routes.add(shortestRoute);
      }
      List<int> stopsList = [];
      List<int> interchangesList = [];
      List<ShortestPathResult> bestRoutes = [];
      for (var element in routes) {
          int stops = 0;
          for (var direction in element.route.route) {
            stops += direction.stops;
          }
          int interchanges = element.numInterchanges;
          if (stops >= 2) {
            stopsList.add(stops);
            interchangesList.add(interchanges);
            bestRoutes.add(element);
          }
        }

      // //For least stops priority
      // int leastStops = stopsList.reduce(min);
      // List<int> bestRouteIndexList = [];
      // int routeIndex = 0;
      // int bestRouteIndex = 0;

      // //Find index of least stops
      // stopsList.forEach((element) {
      //   if (element == leastStops) {
      //     bestRouteIndexList.add(routeIndex);
      //   }
      //   routeIndex += 1;
      // });

      // //Find least stops with least interchanges if more than one route
      // bestRouteIndexList.forEach((element) {
      //   if (bestRouteIndex != 0) {
      //     if (bestRouteIndex >interchangesList[element]) {
      //       bestRouteIndex =  interchangesList.indexOf(interchangesList[element]);
      //     }
      //   } else {
      //     bestRouteIndex = interchangesList.indexOf(interchangesList[element]);
      //   }
      // });

      //print("incursions end");
      //print("Stops");
      //print(stopsList);
      //print("Interchanges");
      //print(interchangesList);
      //print("Routes");
      //print(bestRoutes.length);
      int bestRouteIndex = priority == UserPriorityStatus.stops
          ? getLeastStopsRoute(stopsList, interchangesList)
          : getLeastInterchangesRoute(stopsList, interchangesList);
      route = bestRoutes.elementAt(bestRouteIndex).route;
      bestRoutes.elementAt(bestRouteIndex).path.forEach((element) {
        //print(element.name);
      });

      for (var incursion in incursions) {
        //print(incursion.name);
      }

      //Find all
      // List<Station> route = shortestRoute.path;
      // route.forEach((element) {
      //   ////print(element.name);
      //   ////print(element.lines);
      //   ////print("");
      // });
    }

    // if (isOffline == false) {
    //    route = await directionsRepository.fetchRoute(
    //        fromMetro, toMetro, destName, destAddress, isOffline);
    // //   final isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
    //   final destination = Directions()
    //     ..time = DateTime.now()
    //     ..fromId = fromMetro.placeId
    //     ..toId = toMetro.placeId
    //     ..destMain = destName
    //     ..destSecondary = destAddress
    //     ..destContent =
    //         "${destName.toString().toLowerCase()} ${destAddress.toLowerCase()}"
    //     ..fromMain = fromMetro.name
    //     ..fromSecondary = fromMetro.vicinity
    //     ..fromContent =
    //         "${fromMetro.name.toString().toLowerCase()} ${fromMetro.vicinity.toLowerCase()}"
    //     ..fromData = fromMetro.data
    //     ..toData = toMetro.data
    //     ..directions = route.data;

    //   await isar.writeTxn(() async {
    //     await isar.directions.put(destination);
    //   });
    // } else {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? offRoute = await isar.directions
    //       .filter()
    //       .fromIdEqualTo(fromMetro.placeId)
    //       .toIdEqualTo(toMetro.placeId)
    //       .sortByTimeDesc()
    //       .findFirst();
    //   route = MetroRoute.fromJson(offRoute!.directions.toString());
    //}¯
    //if (fromMetro.fromName != fromMetro.name) {
    List<MetroDirection> updRouteData = [];
    if (route.route.first.departureName.toLowerCase() !=
        fromMetro.fromName.toLowerCase()) {
      updRouteData.add(
        MetroDirection(
            platform: "",
            stops: 0,
            travelMode: "WALKING",
            vehicleType: "WALKING",
            metro: "DMRC",
            departureName: fromMetro.fromName,
            arrivalName: fromMetro.name,
            currLineName: "",
            currLineColour: 000000,
            interchange: "",
            duration: "",
            headsign: "",
            stations: const []),
      );
    }
    updRouteData.addAll(route.route);
    if (route.route.last.arrivalName.toLowerCase() !=
        toMetro.destName.toLowerCase()) {
      updRouteData.add(MetroDirection(
          platform: "",
          stops: 0,
          travelMode: "WALKING",
          vehicleType: "WALKING",
          metro: "DMRC",
          departureName: toMetro.name,
          arrivalName: toMetro.destName,
          currLineName: "",
          currLineColour: 000000,
          interchange: "",
          duration: "",
          headsign: "",
          stations: const []));
    }

    route.route = updRouteData;
    //}
    emit(state.copyWith(
        status: DirectionsStatus.loaded,
        routeData: route,
        isOffline: isOffline));
  }

  getLeastStopsRoute(List<int> stopsList, List<int> interchangesList) {
    //For least stops priority
    int leastStops = stopsList.reduce(min);
    List<int> bestRouteIndexList = [];
    int bestRouteIndex = -1;

    //Find index of least stops
    int i = 0;
    for (var element in stopsList) {
      if (element == leastStops) {
        bestRouteIndexList.add(i);
      }
      i += 1;
    }
    //print("LEAST STATIONS");
    //print(bestRouteIndexList);
    bestRouteIndex = bestRouteIndexList.first;
    if (bestRouteIndexList.length > 1) {
      for (var element in bestRouteIndexList) {
        if (interchangesList[bestRouteIndex] > interchangesList[element]) {
          bestRouteIndex = element;
        }
      }
    }
    //Find least interchanges with least stops if more than one route

    return bestRouteIndex;
  }

  

  getLeastInterchangesRoute(List<int> stopsList, List<int> interchangesList) {
    //For least interchanges priority
    int leastInterchanges = interchangesList.reduce(min);
    List<int> bestRouteIndexList = [];
    int bestRouteIndex = 0;
    //print("least interchNGESSSS");
    //print(leastInterchanges);
    //Find index of least stops
    int i = 0;
    for (var element in interchangesList) {
      if (element == leastInterchanges) {
        bestRouteIndexList.add(i);
      }
      i += 1;
    }
    //print(bestRouteIndexList);
    bestRouteIndex = bestRouteIndexList.first;
    //Find least stops with least interchanges if more than one route
    if (bestRouteIndexList.length > 1) {
      for (var element in bestRouteIndexList) {
        if (stopsList[bestRouteIndex] > stopsList[element]) {
          bestRouteIndex = element;
        }
      }
    }
    //print(bestRouteIndex);
    return bestRouteIndex;
  }

  showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action for the first button
                },
                child: const SizedBox(
                  width: 180,
                  height: 180,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for the second button
                },
                child: const SizedBox(
                  width: 180,
                  height: 180,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Station {
  String id;
  String name;
  double latitude;
  double longitude;
  bool isInterchange;
  bool? isFob;
  List<String> lines;
  String? fobLine;
  int? fobStationIndex;

  Station(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.isInterchange,
      required this.lines,
      this.isFob = false,
      this.fobLine,
      this.fobStationIndex});

  // Method to convert the User object to a map
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "isInterchange": isInterchange,
        "lines": lines,
        "isFob": isFob,
        "fobLine": fobLine,
        "fobStationIndex": fobStationIndex
      };
}
class AltEdge {
  Station source;
  Station destination;
  double weight;
  int interchanges;

  AltEdge({
    required this.source,
    required this.destination,
    required this.weight,
    this.interchanges = 0,
  });
}

class AltGraph {
  List<Station> stations;
  List<AltEdge> edges;

  AltGraph({required this.stations, required this.edges});

  List<AltEdge> getEdges(Station station) {
    return edges.where((edge) => edge.source.name == station.name).toList();
  }
}

class PathInfo implements Comparable<PathInfo> {
  List<Station> path;
  List<Station> interchanges;
  int get interchangeCount => interchanges.length;

  PathInfo({required this.path, required this.interchanges});

  @override
  int compareTo(PathInfo other) {
    return interchangeCount.compareTo(other.interchangeCount);
  }
}


ShortestPathResult findLeastInterchangePath(Graph graph, Station start, Station end, Map<String, dynamic> metroData) {
  //Check if both have same line in common
  final set1 = start.lines.toSet();
  bool isSameLine = set1.intersection(end.lines.toSet()).isNotEmpty;
  // //Check for blue branch condition
  List<dynamic> blueLineData = metroData["data"]["line_3"]["stations"];

  List<String> beforeBlueBranchPointStations = [];
  bool reachedBranchPt = false;
  for( dynamic stationData in blueLineData){
    if(stationData["name"]!="Yamuna Bank" && reachedBranchPt==false){
    beforeBlueBranchPointStations.add(stationData["name"]);
    }else{
      reachedBranchPt = true;
    }
  }

  // }
  if(isSameLine){
    ShortestPathResult route = findShortestPath(graph, start, end, metroData);
    return route;
  }else{
    //Find list of interchange stations in start station's lines
    List<ShortestPathResult> totalPathInfos = [];
    List<Station> totalFirstInterchanges = [];
    List<String> totalLines = start.lines;
    if(totalLines.contains("line_4")){
      totalLines.add("line_3");
    }
    List<Station> totalStations = graph.stations;
    for (String line in totalLines){
      for(Station station in totalStations){
        if(
          station.lines.contains(line) && 
          station.isInterchange && 
          station!=start &&
          totalFirstInterchanges.contains(station)==false
          ){
            //Check blue branch line condition
            if(start.lines.contains("line_4") && 
            station.lines.contains("line_3") &&
            beforeBlueBranchPointStations.contains(station.name)==false
            ){
              if(station.name!="Yamuna Bank"){
                totalFirstInterchanges.add(station);
              }

            }else{
                totalFirstInterchanges.add(station);
            }

        }
      }
    }
    //Find paths from each of them
    for(Station firstInterchangeStation in totalFirstInterchanges){
      ShortestPathResult pathData = findShortestPath(graph, firstInterchangeStation, end, metroData);
      totalPathInfos.add(pathData);
    }
    //Sort paths according to interchanges count
    totalPathInfos.sort((a, b) => a.numInterchanges.compareTo(b.numInterchanges));
    for (var pathInfo in totalPathInfos) {
      print("First Interchange");
      print(pathInfo.path.first.name);
      print("Path");
      print(pathInfo.path.map((station) => station.name).join(" -> "));
      print("Total Interchanges");
      print(pathInfo.numInterchanges);
      print("");
    }
    
    ShortestPathResult bestFirstInterchangePathInfo = totalPathInfos.first;
    //Find pathinfo from start to first interchange station
    Station bestFirstInterchange = bestFirstInterchangePathInfo.path.first;
    List<Station> initialPath = [];
    if(set1.intersection(bestFirstInterchange.lines.toSet()).isNotEmpty){
    String initialLine = set1.intersection(bestFirstInterchange.lines.toSet()).first;
    List<dynamic> initialLineData = metroData["data"][initialLine]["stations"];
    List<Station> initialLineInfo = [];
    int startStationIndex = 0;
    int bestFirstInterchangeIndex = 0;
    int i = 0;
    for(dynamic stationData in initialLineData){
        List<dynamic> dynamicLines = stationData["interchange_data"]["lines"];
        List<String> lines = dynamicLines.map((e) => e.toString()).toList();
        if(start.name==stationData["name"]){
          startStationIndex = i;
        }
        if(bestFirstInterchange.name==stationData["name"]){
          bestFirstInterchangeIndex = i;
        }
        Station stationInfo = Station(
            id: stationData["place_id"],
            name: stationData["name"],
            latitude: stationData["coordinates"]["lat"],
            longitude: stationData["coordinates"]["lng"],
            isInterchange: stationData["is_interchange"],
            isFob: stationData.containsKey("is_fob") == true ? true : false,
            fobLine: stationData.containsKey("fob_data") == true
                ? stationData["fob_data"]["line"]
                : "",
            fobStationIndex: stationData.containsKey("fob_data") == true
                ? stationData["fob_data"]["index"]
                : -1,
            lines: lines);
            initialLineInfo.add(stationInfo);
        i++;
    }
    if(startStationIndex<bestFirstInterchangeIndex){
      if(bestFirstInterchangeIndex<initialLineInfo.length-1){
      initialLineInfo =  initialLineInfo.sublist(startStationIndex,bestFirstInterchangeIndex+1);
      }else{
      initialLineInfo =  initialLineInfo.sublist(startStationIndex);
      }
    }else{
      if(startStationIndex<initialLineInfo.length-1){
      initialLineInfo = initialLineInfo.sublist(bestFirstInterchangeIndex,startStationIndex+1);
      }else{
      initialLineInfo = initialLineInfo.sublist(bestFirstInterchangeIndex);
      }
      initialLineInfo = initialLineInfo.reversed.toList();
      //initialLineInfo = initialLineInfo.toList();
    }
    initialPath.addAll(initialLineInfo);
    print("Station Indexes");
    print(initialPath.map((station) => station.name).join(" -> "));
    }else{
      ShortestPathResult initialRoute = findShortestPath(graph, start, bestFirstInterchange, metroData);
      initialPath = initialRoute.path;
    }

    List<Station> leastInterchangePath = initialPath;
    leastInterchangePath.addAll(bestFirstInterchangePathInfo.path.sublist(1)); 
    double leastInterchangePathDistance = 0;
    Station previousStation = leastInterchangePath.first;
    for(Station station in leastInterchangePath){
      if(station!=leastInterchangePath.first){
        double stationDistance = _distance(previousStation, station);
        leastInterchangePathDistance += stationDistance;
      }else{
        previousStation = station;
      }

    }

    //Find route interchanges in this path
    List<int> routeInterchanges = [];
    Station? directionStart;
    Set<String> prevIntersection = {};

      for (var i = 0; i < leastInterchangePath.length - 1; i++) {
        List<String>? prevLines;
        List<String>? currLines;
        List<String>? nextLines;
        if (i == 0) {
          prevLines = leastInterchangePath[i].lines;
          currLines = leastInterchangePath[i].lines;
          nextLines = leastInterchangePath[i + 1].lines;
          directionStart = leastInterchangePath[i];
        } else if (i != leastInterchangePath.length - 1) {
          prevLines = leastInterchangePath[i - 1].lines;
          currLines = leastInterchangePath[i].lines;
          nextLines = leastInterchangePath[i + 1].lines;
        } else if (i == leastInterchangePath.length - 1) {
          prevLines = leastInterchangePath[i - 1].lines;
          currLines = leastInterchangePath[i].lines;
          nextLines = leastInterchangePath[i].lines;
        }
        Set<String> set1 = Set.from(prevLines!);
        Set<String> set2 = Set.from(currLines!);
        Set<String> set3 = Set.from(nextLines!);

        Set<String> intersection = set1.intersection(set2).intersection(set3);

        Set<String> checkPrevLines = {};
        //print("------");
        if (prevIntersection.isEmpty != true) {
          //print(prevIntersection);
          checkPrevLines = prevIntersection.intersection(intersection);
        } else {
          checkPrevLines = intersection;
        }
        //print(intersection);
        //print("------");
        if (checkPrevLines.isNotEmpty) {
          prevIntersection = intersection;
        } else if (i != leastInterchangePath.length - 1) {
          if ((leastInterchangePath[i].isFob == true && leastInterchangePath[i + 1].isFob == false) ||
              (leastInterchangePath[i].isFob == false && leastInterchangePath[i + 1].isFob == false)) {
            

            routeInterchanges.add(i);
            //print(path[i].name);
            prevIntersection = set3;
          }
        }
      }
    
    //Combine initial and least interchange path info
    MetroRoute leastInterchangeRoute = getMetroRoute(leastInterchangePath, routeInterchanges, metroData);
    ShortestPathResult leastInterchangePathInfo = ShortestPathResult(
      path: leastInterchangePath, 
      distance: leastInterchangePathDistance, 
      incursions: [], 
      numInterchanges: bestFirstInterchangePathInfo.numInterchanges+1, 
      route: leastInterchangeRoute
      );
      return leastInterchangePathInfo;

  }
}








class Edge {
  Station source;
  Station destination;
  double weight;

  Edge({required this.source, required this.destination, required this.weight});
}

class Graph {
  List<Station> stations;
  List<Edge> edges;

  Graph({required this.stations, required this.edges});

  List<Edge> getEdges(Station station) {
    return edges.where((edge) => edge.source == station).toList();
  }
}

double _distance(Station station1, Station station2) {

  const double earthRadius = 6371; // Radius of the Earth in kilometers

  double lat1Rad = station1.latitude * (pi / 180);
  double lon1Rad = station1.longitude * (pi / 180);
  double lat2Rad = station2.latitude * (pi / 180);
  double lon2Rad = station2.longitude * (pi / 180);

  double dLat = lat2Rad - lat1Rad;
  double dLon = lon2Rad - lon1Rad;

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1  
 - a));

  return earthRadius * c; // Distance in kilometers
}

Graph createGraphFromJson(List<Station> stations,
    Map<String, List<Station>> metroData, Station incursion) {
  final List<Edge> edges = [];
  final List<String> lines = metroData.keys.toList();
  for (final line in lines) {
    List<Station> lineData = metroData[line] ?? [];
    for (final station in lineData) {
      List<String> stationLines = station.lines;
      //Check FOB
      if (station.isFob == true) {
        Edge stationEdge = Edge(
            source: station,
            destination: metroData[station.fobLine]![station.fobStationIndex!],
            weight: _distance(station, lineData[1]));

        if (edges.contains(stationEdge) == false) {
          if (incursion.name != stationEdge.source.name) {
            edges.add(stationEdge);
          } else {
            //print("source is ${stationEdge.source.name}");

            //print("incursion is ${incursion.name}");
            ////print(stationEdge.destination.name);
          }
        }
      }
      //Check Lines
      for (final stationLine in stationLines) {
        List<Station> lineData = metroData[stationLine] ?? [];
        //Check for nornal lines
        int stationIndex = 0;
        for (var element in lineData) {
          if (element.name == station.name) {
            stationIndex = lineData.indexOf(element);
          }
        }

        if (stationIndex == 0) {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[1],
              weight: _distance(station, lineData[1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        } else if (stationIndex == lineData.length - 1) {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex - 1],
              weight: _distance(station, lineData[stationIndex - 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        } else {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex - 1],
              weight: _distance(station, lineData[stationIndex - 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print(stationEdge.source.name);
              ////print(stationEdge.destination.name);
            }
          }
          stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex + 1],
              weight: _distance(station, lineData[stationIndex + 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        }

        //Check for reversed list
        lineData = lineData.reversed.toList();
        stationIndex = 0;
        for (var element in lineData) {
          if (element.name == station.name) {
            stationIndex = lineData.indexOf(element);
          }
        }

        if (stationIndex == 0) {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[1],
              weight: _distance(station, lineData[1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        } else if (stationIndex == lineData.length - 1) {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex - 1],
              weight: _distance(station, lineData[stationIndex - 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        } else {
          Edge stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex - 1],
              weight: _distance(station, lineData[stationIndex - 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print(stationEdge.source.name);
              ////print(stationEdge.destination.name);
            }
          }
          stationEdge = Edge(
              source: station,
              destination: lineData[stationIndex + 1],
              weight: _distance(station, lineData[stationIndex + 1]));

          if (edges.contains(stationEdge) == false) {
            if (incursion.name != stationEdge.source.name) {
              edges.add(stationEdge);
            } else {
              //print("source is ${stationEdge.source.name}");

              //print("incursion is ${incursion.name}");
              ////print(stationEdge.destination.name);
            }
          }
        }
      }
    }
    // final neighboringStations = stations
    //     .where((otherStation) =>
    //         otherStation != station &&
    //         otherStation.lines.any((line) => station.lines.contains(line)))
    //     .toList();
    // for (final neighboringStation in neighboringStations) {
    //   edges.add(Edge(
    //       source: station,
    //       destination: neighboringStation,
    //       weight: _distance(station, neighboringStation)));
    // }
  }
  return Graph(stations: stations, edges: edges);
}

class ShortestPathResult {
  List<Station> path;
  double distance;
  List<Station> incursions;
  int numInterchanges;
  MetroRoute route;

  ShortestPathResult(
      {required this.path,
      required this.distance,
      required this.incursions,
      required this.numInterchanges,
      required this.route});
}

class PriorityQueue<Station> {
  final List<Station> _heap;
  final Comparator<Station> _comparator;

  PriorityQueue(this._comparator) : _heap = [];

  void add(Station element) {
    _heap.add(element);
    _siftUp(_heap.length - 1);
  }

  Station removeFirst() {
    if (_heap.isEmpty) {
      throw StateError('Priority queue is empty');
    }
    final first = _heap[0];
    final last = _heap.removeLast();
    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _siftDown(0);
    }
    return first;
  }

  bool get isNotEmpty => _heap.isNotEmpty;

  void _siftUp(int index) {
    if (index == 0) {
      return;
    }
    final parentIndex = (index - 1) ~/ 2;
    final parent = _heap[parentIndex];
    final element = _heap[index];
    if (_comparator(parent, element) > 0) {
      _heap[parentIndex] = element;
      _heap[index] = parent;
      _siftUp(parentIndex);
    }
  }

  void _siftDown(int index) {
    final leftChildIndex = index * 2 + 1;
    final rightChildIndex = index * 2 + 2;
    if (leftChildIndex >= _heap.length) {
      return;
    }
    final current = _heap[index];
    final leftChild = _heap[leftChildIndex];
    final rightChild =
        rightChildIndex < _heap.length ? _heap[rightChildIndex] : null;
    if (rightChild == null || _comparator(leftChild, rightChild) < 0) {
      if (_comparator(current, leftChild) > 0) {
        _heap[index] = leftChild;
        _heap[leftChildIndex] = current;
        _siftDown(leftChildIndex);
      }
    } else {
      if (_comparator(current, rightChild) > 0) {
        _heap[index] = rightChild;
        _heap[rightChildIndex] = current;
        _siftDown(rightChildIndex);
      }
    }
  }
}

ShortestPathResult findShortestPath(
    Graph graph, Station start, Station end, Map<String, dynamic> metroData) {
  
  final Map<Station, double> distances = {};
  final Map<Station, Station> parents = {};
  final Set<Station> visited = {};
  final PriorityQueue<Station> queue =
      PriorityQueue((a, b) => (distances[a] ?? 0).compareTo(distances[b] ?? 0));

  distances[start] = 0;
  queue.add(start);

  List<Station> path = [end];

  List<int> routeInterchanges = [];
  List<Station> routeIncursions = [];

  double distance = distances[end] ?? 0;
  while (queue.isNotEmpty) {
    final current = queue.removeFirst();

    if (current == end) {
      while (parents[path.last] != null) {
        path.add(parents[path.last]!);
      }
      path = path.reversed.toList();
      print(path.map((station) => station.name).join(" -> "));

      //Check if destination reached before it goes around and comeback
      int destIndex = -1;
      int i = 0;
      for (var element in path) {
        if (element.name == end.name && destIndex == -1) {
          destIndex = i;
        }
        i++;
      }
      if (destIndex != -1) {
        path = path.sublist(0, destIndex + 1);
      }

      print("Path");
      for (var element in path) {
        print(element.name);
      }

      //Get Same Line Direction
      Station? directionStart;
      Station? directionEnd;
      //print("");
      //print("Total Incursions");
      bool isIncursion = false;

      Set<String> prevIntersection = {};

      for (var i = 0; i < path.length - 1; i++) {
        List<String>? prevLines;
        List<String>? currLines;
        List<String>? nextLines;
        if (i == 0) {
          prevLines = path[i].lines;
          currLines = path[i].lines;
          nextLines = path[i + 1].lines;
          directionStart = path[i];
        } else if (i != path.length - 1) {
          prevLines = path[i - 1].lines;
          currLines = path[i].lines;
          nextLines = path[i + 1].lines;
        } else if (i == path.length - 1) {
          prevLines = path[i - 1].lines;
          currLines = path[i].lines;
          nextLines = path[i].lines;
        }
        Set<String> set1 = Set.from(prevLines!);
        Set<String> set2 = Set.from(currLines!);
        Set<String> set3 = Set.from(nextLines!);

        Set<String> intersection = set1.intersection(set2).intersection(set3);
        if (currLines.length > 1) {
          isIncursion = true;
        }

        Set<String> checkPrevLines = {};
        //print("------");
        if (prevIntersection.isEmpty != true) {
          //print(prevIntersection);
          checkPrevLines = prevIntersection.intersection(intersection);
        } else {
          checkPrevLines = intersection;
        }
        //print(intersection);
        //print("------");
        if (checkPrevLines.isNotEmpty) {
          //Same Direction
          ////print(intersection.first);
          if (currLines.length > 1 &&
              end.name != path[i].name &&
              start.name != path[i].name &&
              end.name != path[i + 1].name &&
              start.name != path[i + 1].name) {
            routeIncursions.add(path[i + 1]);
            ////print(path[i+1].name);
          }
          isIncursion = false;

          prevIntersection = intersection;
        } else if (i != path.length - 1) {
          if ((path[i].isFob == true && path[i + 1].isFob == false) ||
              (path[i].isFob == false && path[i + 1].isFob == false)) {
            if (end.name != path[i].name &&
                start.name != path[i].name &&
                end.name != path[i + 1].name &&
                start.name != path[i + 1].name) {
              routeIncursions.add(path[i + 1]);

              ////print(path[i+1].name);
            }

            routeInterchanges.add(i);
            //print(path[i].name);
            prevIntersection = set3;
          }
        }
      }
      //print("asd");
      //Get Directions
      List<MetroDirection> directions = [];
    }
    if (visited.contains(current)) {
      continue;
    }
    visited.add(current);
    final currentDistance = distances[current] ?? double.infinity;
    for (final edge in graph.getEdges(current)) {
      final newDistance = currentDistance + edge.weight;
      final destination = edge.destination;
      if (distances[destination] == null ||
          newDistance < distances[destination]!) {
        distances[destination] = newDistance;
        parents[destination] = current;
        if (!visited.contains(destination)) {
          queue.add(destination);
        }
      }
    }
  }

  print("final path");
  for (var element in path) {
    print(element.name);
  }
  print("");
  MetroRoute metroRoute = MetroRoute.initial();
  try {
    metroRoute = getMetroRoute(path, routeInterchanges, metroData);
  } catch (e) {
    print("Invalid Route");
  }
  return ShortestPathResult(
      path: path,
      incursions: routeIncursions,
      distance: distance,
      numInterchanges: routeInterchanges.length,
      route: metroRoute);
}

ShortestPathResult findMinIntPath(
    Graph graph, Station start, Station end, Map<String, dynamic> metroData) {
  final Map<Station, double> distances = {};
  final Map<Station, Station> parents = {};
  final Map<Station, int> interchanges = {};
  final Set<Station> visited = {};
  final PriorityQueue<Station> queue = PriorityQueue((a, b) {
    if (interchanges[a]! < interchanges[b]!) {
      return -1;
    } else if (interchanges[a]! > interchanges[b]!) {
      return 1;
    } else {
      return distances[a]!.compareTo(distances[b]!);
    }
  });

  distances[start] = 0;
  interchanges[start] = 0;
  queue.add(start);

  List<int> routeInterchanges = [];
  List<Station> path = [end];

  final numInterchanges = interchanges[end] ?? 0;
  final distance = distances[end] ?? 0;

  while (queue.isNotEmpty) {
    final current = queue.removeFirst();
    if (current == end) {
      while (parents[path.last] != null) {
        path.add(parents[path.last]!);
      }
      path = path.reversed.toList();

      //Check if destination reached before it goes around and comeback
      int destIndex = -1;
      int i = 0;
      for (var element in path) {
        print(element.name);
        print("____");
        if (element.name == end.name && destIndex == -1) {
          destIndex = i;
        }
        i++;
      }
      print(destIndex);
      if (destIndex != -1) {
        path = path.sublist(0, destIndex + 1);
      }

      //Get Same Line Direction
      Station? directionStart;
      Station? directionEnd;
      List<Station> routeIncursions = [];
      Set<String> prevIntersection = {};
      for (var i = 0; i < path.length; i++) {
        List<String>? prevLines;
        List<String>? currLines;
        List<String>? nextLines;
        if (i == 0) {
          prevLines = path[i].lines;
          currLines = path[i].lines;
          nextLines = path[i + 1].lines;
          directionStart = path[i];
        } else if (i != path.length - 1) {
          prevLines = path[i - 1].lines;
          currLines = path[i].lines;
          nextLines = path[i + 1].lines;
        } else if (i == path.length - 1) {
          prevLines = path[i - 1].lines;
          currLines = path[i].lines;
          nextLines = path[i].lines;
        }
        Set<String> set1 = Set.from(prevLines!);
        Set<String> set2 = Set.from(currLines!);
        Set<String> set3 = Set.from(nextLines!);

        Set<String> intersection1 = set1.intersection(set2);
        Set<String> intersection2 = set2.intersection(set3);
        Set<String> intersection = intersection1.intersection(intersection2);

        if (prevIntersection.intersection(intersection).isNotEmpty &&
            i != path.length - 1) {
          //Same Direction
          ////print(intersection.first);
          routeIncursions.add(path[i + 1]);
        } else {
          routeInterchanges.add(i);
        }
        prevIntersection = intersection;
      }
    }
    if (visited.contains(current)) {
      continue;
    }
    visited.add(current);
    final currentDistance = distances[current] ?? double.infinity;
    final currentInterchanges = interchanges[current]!;
    for (final edge in graph.getEdges(current)) {
      final newDistance = currentDistance + edge.weight;
      final destination = edge.destination;
      final isInterchange = destination.isInterchange;
      //final currentLines = current.lines.toSet();
      //final destinationLines = destination.lines.toSet();
      //final commonLines = currentLines.intersection(destinationLines).toList();
      //final numCommonLines = commonLines.length;
      //final numLines = currentLines.length + destinationLines.length - numCommonLines;
      final newInterchanges = currentInterchanges + (isInterchange ? 1 : 0);
      if (distances[destination] == null ||
          newInterchanges < interchanges[destination]! ||
          (newInterchanges == interchanges[destination]! &&
              newDistance < distances[destination]!)) {
        distances[destination] = newDistance;
        interchanges[destination] = newInterchanges;
        parents[destination] = current;

        if (!visited.contains(destination)) {
          queue.add(destination);
        }
      }
    }
  }

  print("final int path");
  for (var element in path) {
    print(element.name);
  }
  print("");
  MetroRoute metroRoute = MetroRoute.initial();
  //Get Directions
  List<MetroDirection> directions = [];
  try {
    metroRoute = getMetroRoute(path, routeInterchanges, metroData);
  } catch (e) {
    print("Invalid Route");
  }
  return ShortestPathResult(
      path: path,
      incursions: [],
      distance: distance,
      numInterchanges: numInterchanges,
      route: metroRoute);
}

getMetroRoute(List<Station> path, List<int> interchanges,
    Map<String, dynamic> metroData) {
  MetroRoute metro;
  List<MetroDirection> routeDirections = [];
  int fare = 10;
  double routeDistance = 0;
  //Check Blue Line Branch
  List<int> updInterchanges = [];
  for (var interchangeStationIndex in interchanges) {
    Station interchangeStation = path[interchangeStationIndex];
    if (interchangeStation.lines.contains("line_3") == true &&
        interchangeStation.lines.contains("line_4") == true) {
      if (path.length - 1 != interchangeStationIndex &&
          interchangeStationIndex != 0) {
        Station beforeInterchangeStation = path[interchangeStationIndex - 1];
        Station afterInterchangeStation = path[interchangeStationIndex + 1];
        if (beforeInterchangeStation.lines != afterInterchangeStation.lines) {
          List<dynamic> stations = metroData["data"]["line_3"]["stations"];
          int? startIndex;
          int? endIndex;
          for (var element in stations) {
            if (element["place_id"] == afterInterchangeStation.id) {
              endIndex = stations.indexOf(element);
            }
            if (element["place_id"] == beforeInterchangeStation.id) {
              startIndex = stations.indexOf(element);
            }
          }
          ////print(startIndex);
          ////print(endIndex);
          if (endIndex != null && endIndex < 33) {
            ////print("interchange removed");
          } else if (startIndex != null && startIndex < 33) {
            //interchanges = [];
            ////print("interchange removed");
          } else {
            updInterchanges.add(interchangeStationIndex);
          }
        }
      }
    } else {
      updInterchanges.add(interchangeStationIndex);
    }
  }
  ////print(interchanges);
  interchanges = updInterchanges;
  ////print(interchanges);
  for (var element in path) {
    ////print(element.name);
  }

  // if ((path.first.lines.contains("line_4") == true &&
  //         path.last.lines.contains("line_3") == true) ||
  //     (path.first.lines.contains("line_3") == true &&
  //         path.last.lines.contains("line_4") == true)) {
  //   List<dynamic> stations = metroData["data"]["line_3"]["stations"];
  //   int? startIndex;
  //   int? endIndex;
  //   stations.forEach((element) {
  //     if (element["place_id"] == path.last.id) {
  //       endIndex = stations.indexOf(element);
  //     }
  //     if (element["place_id"] == path.first.id) {
  //       startIndex = stations.indexOf(element);
  //     }
  //   });
  //   ////print(endIndex);
  //   if (endIndex != null && endIndex! < 33) {
  //     interchanges = [];
  //   }
  //   if (startIndex != null && startIndex! < 33) {
  //     interchanges = [];
  //   }
  // }
  print("Interchanges");
  print(interchanges.isEmpty);
  print(interchanges);
  //Get Transit Direction
  if (interchanges.isEmpty == true) {
    Station start = path.first;
    Station end = path.last;
    String line = "";
    List<dynamic> stations = [];
    List<String> commonLines =
        start.lines.where((item) => end.lines.contains(item)).toList();

    if ((path.first.lines.contains("line_4") == true &&
                path.last.lines.contains("line_3") == true) &&
            commonLines.isEmpty == true ||
        (path.first.lines.contains("line_3") == true &&
            path.last.lines.contains("line_4") == true &&
            commonLines.isEmpty == true)) {
      line = "line_3";
      stations = metroData["data"][line]["stations"];
      stations = stations.getRange(0, 33).toList();
      stations.addAll(metroData["data"]["line_4"]["stations"]);
    } else {
      //If FOB
      if (commonLines.isEmpty) {
        end = path[path.length - 2];
      }
      line = start.lines.where((item) => end.lines.contains(item)).first;
      stations = metroData["data"][line]["stations"];
    }
    //Get Line Name
    int startIndex = 0;
    int endIndex = 0;
    int stops = 0;
    String headsign = "";
    bool isBridge = false;
    String arrivalName = "";
    for (var element in stations) {
      if (element["place_id"] == start.id) {
        startIndex = stations.indexOf(element);
      }
      if (element["place_id"] == end.id) {
        endIndex = stations.indexOf(element);
        arrivalName = stations[endIndex]["name"];
      }
      if (element["place_id"] == end.id && element["name"] != path.last.name) {
        isBridge = true;
      }
    }
    if (startIndex > endIndex) {
      headsign = stations.first["name"];
      stations = stations.reversed.toList();
      stops = startIndex - endIndex + 0;
    } else {
      headsign = stations.last["name"];
      stops = endIndex - startIndex + 0;
    }
    double transitDistance = 0;
    for (var j = 0; j <= path.length - 2; j++) {
      transitDistance += calculateDistance(path[j].latitude, path[j].longitude,
          path[j + 1].latitude, path[j + 1].longitude);
    }
    if (line == "line_10") {
      fare = fareCalculator(0, isAirport: true, airportStations: stops);
    } else {
      fare = fareCalculator(transitDistance.toInt());
    }
    routeDistance = transitDistance;

    String transitPlatform = "";
    Map<String, dynamic> startStationInfo =
        metroData["data"][line]["stations"][startIndex];
    if (startStationInfo.containsKey("platforms") == true) {
      if (startStationInfo["platforms"].containsKey(line) == true) {
        if (startIndex > endIndex) {
          transitPlatform =
              startStationInfo["platforms"][line]["towards_start"];
        }
        if (endIndex > startIndex) {
          transitPlatform = startStationInfo["platforms"][line]["towards_end"];
        }
      }
    }
    MetroDirection transit = MetroDirection(
        platform: transitPlatform,
        stops: stops,
        travelMode: "TRANSIT",
        vehicleType: "SUBWAY",
        metro: "DMRC",
        departureName: start.name,
        arrivalName: arrivalName,
        currLineName: metroData["data"][line]["name"],
        currLineColour:
            int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
        interchange: "",
        duration: "${(transitDistance / 30 * 60).toStringAsFixed(0)} mins",
        headsign: headsign,
        stations: stations);
    routeDirections.add(transit);

    if (isBridge == true) {
      for (var element in path.last.lines) {
        if (element != line) {
          line = element;
        }
      }
      MetroDirection bridge = MetroDirection(
          platform: "",
          stops: 0,
          travelMode: "WALKING",
          vehicleType: "BRIDGE",
          metro: "DMRC",
          departureName: path.last.name,
          arrivalName: path.last.name,
          currLineName: metroData["data"][line]["name"],
          currLineColour:
              int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
          interchange: arrivalName,
          duration: "",
          headsign: "",
          stations: const []);
      routeDirections.add(bridge);
    }
  } else {
    //print("-----");
    for (var element in interchanges) {
      //print(path[element].name);
    }
    //print("------");
    for (var i = 0; i <= interchanges.length - 1; i++) {
      List<Station> direction = [];
      if (i == 0) {
        int end = interchanges[i];

        int start = 0;
        direction = path.getRange(start, end + 1).toList();
        for (var element in direction) {
          ////print(element.name);
        }
        double transitDistance = 0;
        for (var j = 0; j <= direction.length - 2; j++) {
          transitDistance += calculateDistance(
              direction[j].latitude,
              direction[j].longitude,
              direction[j + 1].latitude,
              direction[j + 1].longitude);
        }
        String line = "";
        ////print("");
        ////print(line);
        List<dynamic> stations = [];
        int startIndex = -1;
        int endIndex = -1;
        int stops = 0;
        String headsign = "";
        String departureName = "";
        String arrivalName = "";
        List<String> commonLines = path[start]
            .lines
            .where((item) => direction.last.lines.contains(item))
            .toList();
        //line = path[start].lines.where((item) => direction.last.lines.contains(item)).first;
        bool isFobIncluded = false;
        if (commonLines.isEmpty == true) {
          //It is FOB
          isFobIncluded = true;
          //Find common lines using last befor station
          commonLines = path[start]
              .lines
              .where((item) =>
                  direction[direction.length - 2].lines.contains(item))
              .toList();
          line = commonLines.first;
        } else {
          line = commonLines.first;
        }
        stations = metroData["data"][line]["stations"];
        print(path[start].name);
        print(path[start].id);
        print(direction.last.name);
        for (var element in stations) {
          if (element["place_id"] == path[start].id) {
            startIndex = stations.indexOf(element);
            departureName = stations[startIndex]["name"];
          }
          if (element["place_id"] == path[end].id) {
            endIndex = stations.indexOf(element);
            arrivalName = stations[endIndex]["name"];
          }
        }

        //Handle Blue Branch condition
        if ((path[start].lines.contains("line_4") == true &&
                    direction.last.lines.contains("line_3") == true) &&
                endIndex <= 33 &&
                startIndex == -1 ||
            (path[start].lines.contains("line_3") == true &&
                    direction.last.lines.contains("line_4") == true) &&
                endIndex == -1 &&
                startIndex <= 33) {
          line = "line_3";
          stations = metroData["data"][line]["stations"];
          stations = stations.getRange(0, 33).toList();
          stations.addAll(metroData["data"]["line_4"]["stations"]);
          // line = path[start]
          //     .lines
          //     .where((item) => path[end].lines.contains(item))
          //     .first;
        }
        for (var element in stations) {
          if (element["place_id"] == path[start].id) {
            startIndex = stations.indexOf(element);
            departureName = stations[startIndex]["name"];
          }
          if (element["place_id"] == path[end].id) {
            endIndex = stations.indexOf(element);
            arrivalName = stations[endIndex]["name"];
          }
        }
        if (startIndex > endIndex) {
          headsign = stations.first["name"];
          stations = stations.reversed.toList();
          stops = startIndex - endIndex + 0;
        } else {
          headsign = stations.last["name"];
          stops = endIndex - startIndex + 0;
        }

        if (line == "line_10") {
          fare += fareCalculator(0, isAirport: true, airportStations: stops);
        } else {
          routeDistance += transitDistance;
        }

        String transitPlatform = "";
        Map<String, dynamic> startStationInfo =
            metroData["data"][line]["stations"][startIndex];
        if (startStationInfo.containsKey("platforms") == true) {
          if (startStationInfo["platforms"].containsKey(line) == true) {
            if (startIndex > endIndex) {
              transitPlatform =
                  startStationInfo["platforms"][line]["towards_start"];
            }
            if (endIndex > startIndex) {
              transitPlatform =
                  startStationInfo["platforms"][line]["towards_end"];
            }
          }
        }

        MetroDirection transit = MetroDirection(
            platform: transitPlatform,
            stops: stops,
            travelMode: "TRANSIT",
            vehicleType: "SUBWAY",
            metro: "DMRC",
            departureName: departureName,
            arrivalName: arrivalName,
            currLineName: metroData["data"][line]["name"],
            currLineColour:
                int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
            interchange: "",
            duration: "${(transitDistance / 30 * 60).toStringAsFixed(0)} mins",
            headsign: headsign,
            stations: stations);
        routeDirections.add(transit);
        if (isFobIncluded == true) {
          MetroDirection bridge = MetroDirection(
              platform: "",
              stops: 0,
              travelMode: "WALKING",
              vehicleType: "BRIDGE",
              metro: "DMRC",
              departureName: arrivalName,
              arrivalName: direction.last.name,
              currLineName: metroData["data"][line]["name"],
              currLineColour:
                  int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
              interchange: direction.last.name,
              duration: "",
              headsign: "",
              stations: const []);
          routeDirections.add(bridge);
        } else {
          MetroDirection transitInterchange = MetroDirection(
              platform: "",
              stops: 0,
              travelMode: "WALKING",
              vehicleType: "WALKING",
              metro: "DMRC",
              departureName: "",
              arrivalName: "",
              currLineName: "",
              currLineColour: 000000,
              interchange: direction.last.name,
              duration: "",
              headsign: "",
              stations: const []);
          routeDirections.add(transitInterchange);
        }
      } else {
        int end = interchanges[i];
        int start = interchanges[i - 1];
        direction = path.getRange(start, end + 1).toList();
        for (var element in direction) {
          ////print(element.name);
        }
        ////print("");
        String line = "";
        ////print(line);
        List<dynamic> stations = [];
        int startIndex = 0;
        int endIndex = 0;
        int stops = 0;
        String headsign = "";
        String departureName = "";
        String arrivalName = "";
        List<String> commonLines = path[start]
            .lines
            .where((item) => direction.last.lines.contains(item))
            .toList();
        //line = path[start].lines.where((item) => direction.last.lines.contains(item)).first;
        if (commonLines.isEmpty == true) {
          line = "line_3";
        } else {
          line = commonLines.first;
        }
        stations = metroData["data"][line]["stations"];
        for (var element in stations) {
          if (element["place_id"] == path[start].id) {
            startIndex = stations.indexOf(element);
            departureName = stations[startIndex]["name"];
          }
          if (element["place_id"] == path[end].id) {
            endIndex = stations.indexOf(element);
            arrivalName = stations[endIndex]["name"];
          }
        }
        if ((path[start].lines.contains("line_4") == true &&
                    direction.last.lines.contains("line_3") == true) &&
                endIndex <= 33 &&
                startIndex == 0 ||
            (path[start].lines.contains("line_3") == true &&
                    direction.last.lines.contains("line_4") == true) &&
                endIndex == 0 &&
                startIndex <= 33) {
          line = "line_3";
          stations = metroData["data"][line]["stations"];
          stations = stations.getRange(0, 33).toList();
          stations.addAll(metroData["data"]["line_4"]["stations"]);

          // line = path[start]
          //     .lines
          //     .where((item) => path[end].lines.contains(item))
          //     .first;
        }
        for (var element in stations) {
          if (element["place_id"] == path[start].id) {
            startIndex = stations.indexOf(element);
            departureName = stations[startIndex]["name"];
          }
          if (element["place_id"] == path[end].id) {
            endIndex = stations.indexOf(element);
            arrivalName = stations[endIndex]["name"];
          }
        }
        if (startIndex > endIndex) {
          headsign = stations.first["name"];
          stations = stations.reversed.toList();
          stops = startIndex - endIndex + 0;
        } else {
          headsign = stations.last["name"];
          stops = endIndex - startIndex + 0;
        }

        double transitDistance = 0;
        for (var j = 0; j <= direction.length - 2; j++) {
          transitDistance += calculateDistance(
              direction[j].latitude,
              direction[j].longitude,
              direction[j + 1].latitude,
              direction[j + 1].longitude);
        }
        if (line == "line_10") {
          fare += fareCalculator(0, isAirport: true, airportStations: stops);
        } else {
          routeDistance += transitDistance;
        }

        String transitPlatform = "";
        Map<String, dynamic> startStationInfo =
            metroData["data"][line]["stations"][startIndex];
        if (startStationInfo.containsKey("platforms") == true) {
          if (startStationInfo["platforms"].containsKey(line) == true) {
            if (startIndex > endIndex) {
              transitPlatform =
                  startStationInfo["platforms"][line]["towards_start"];
            }
            if (endIndex > startIndex) {
              transitPlatform =
                  startStationInfo["platforms"][line]["towards_end"];
            }
          }
        }
        print("Direction");
        print(departureName);
        print(arrivalName);
        MetroDirection transit = MetroDirection(
            platform: transitPlatform,
            stops: stops,
            travelMode: "TRANSIT",
            vehicleType: "SUBWAY",
            metro: "DMRC",
            departureName: departureName,
            arrivalName: arrivalName,
            currLineName: metroData["data"][line]["name"],
            currLineColour:
                int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
            interchange: "",
            duration: "${(transitDistance / 30 * 60).toStringAsFixed(0)} mins",
            headsign: headsign,
            stations: stations);
        routeDirections.add(transit);

        MetroDirection transitInterchange = MetroDirection(
            platform: "",
            stops: 0,
            travelMode: "WALKING",
            vehicleType: "WALKING",
            metro: "DMRC",
            departureName: "",
            arrivalName: "",
            currLineName: "",
            currLineColour: 000000,
            interchange: direction.last.name,
            duration: "",
            headsign: "",
            stations: const []);
        routeDirections.add(transitInterchange);
      }

      ////print("");
      ////print(direction.last.name);
      ////print(direction.last.name);
      ////print("");

      // String line = direction.first.lines.where((item) => direction.last.lines.contains(item)).toString();
      // //print("");
      // //print(line);

      // else if(i==interchanges.length-1){
      //   int end = path.length-1;
      //   int start = interchanges.last;
      //   List<Station> direction = path.skip(start+1).toList();
      //   direction.forEach((element) {
      //     //print(element.name);
      //   });
      // }
    }
    int start = interchanges.last;
    List<Station> direction = path.skip(start).toList();
    for (var element in direction) {
      ////print(element.name);
    }
    ////print("");
    String line = "";
    ////print(line);
    List<dynamic> stations = [];
    int startIndex = 0;
    int endIndex = 0;
    int stops = 0;
    String headsign = "";
    String departureName = "";
    String arrivalName = "";
    List<String> commonLines = path[start]
        .lines
        .where((item) => direction.last.lines.contains(item))
        .toList();
    //line = path[start].lines.where((item) => direction.last.lines.contains(item)).first;
    if (commonLines.isEmpty == true) {
      line = "line_3";
    } else {
      line = commonLines.first;
    }
    stations = metroData["data"][line]["stations"];
    for (var element in stations) {
      if (element["place_id"] == path[start].id) {
        startIndex = stations.indexOf(element);
        departureName = stations[startIndex]["name"];
      }
      if (element["place_id"] == direction.last.id) {
        endIndex = stations.indexOf(element);
        arrivalName = stations[endIndex]["name"];
      }
    }
    //print("end is $startIndex");
    if ((path[start].lines.contains("line_4") == true &&
                direction.last.lines.contains("line_3") == true) &&
            endIndex <= 33 &&
            startIndex == 0 ||
        (path[start].lines.contains("line_3") == true &&
                direction.last.lines.contains("line_4") == true) &&
            endIndex == 0 &&
            startIndex <= 33) {
      line = "line_3";
      stations = metroData["data"][line]["stations"];
      stations = stations.getRange(0, 33).toList();
      stations.addAll(metroData["data"]["line_4"]["stations"]);
      // line = path[start]
      //     .lines
      //     .where((item) => direction.last.lines.contains(item))
      //     .first;
    }

    bool isBridge = false;
    for (var element in stations) {
      if (element["place_id"] == path[start].id) {
        startIndex = stations.indexOf(element);
        departureName = stations[startIndex]["name"];
      }
      if (element["place_id"] == direction.last.id &&
          element["name"] == direction.last.name) {
        endIndex = stations.indexOf(element);
        arrivalName = stations[endIndex]["name"];
      }

      if (element["place_id"] == direction.last.id &&
          element["name"] != direction.last.name) {
        isBridge = true;
      }
    }

    if (startIndex > endIndex) {
      headsign = stations.first["name"];
      stations = stations.reversed.toList();
      stops = startIndex - endIndex + 0;
    } else {
      headsign = stations.last["name"];
      stops = endIndex - startIndex + 0;
    }

    double transitDistance = 0;
    for (var j = 0; j <= direction.length - 2; j++) {
      transitDistance += calculateDistance(
          direction[j].latitude,
          direction[j].longitude,
          direction[j + 1].latitude,
          direction[j + 1].longitude);
    }
    if (line == "line_10") {
      fare += fareCalculator(0, isAirport: true, airportStations: stops);
    } else {
      routeDistance += transitDistance;
    }

    String transitPlatform = "";
    Map<String, dynamic> startStationInfo =
        metroData["data"][line]["stations"][startIndex];
    if (startStationInfo.containsKey("platforms") == true) {
      if (startStationInfo["platforms"].containsKey(line) == true) {
        if (startIndex > endIndex) {
          transitPlatform =
              startStationInfo["platforms"][line]["towards_start"];
        }
        if (endIndex > startIndex) {
          transitPlatform = startStationInfo["platforms"][line]["towards_end"];
        }
      }
    }
    MetroDirection transit = MetroDirection(
        platform: transitPlatform,
        stops: stops,
        travelMode: "TRANSIT",
        vehicleType: "SUBWAY",
        metro: "DMRC",
        departureName: departureName,
        arrivalName: arrivalName,
        currLineName: metroData["data"][line]["name"],
        currLineColour:
            int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
        interchange: "",
        duration: "${(transitDistance / 30 * 60).toStringAsFixed(0)} mins",
        headsign: headsign,
        stations: stations);
    routeDirections.add(transit);
    if (isBridge == true) {
      for (var element in direction.last.lines) {
        if (element != line) {
          line = element;
        }
      }
      MetroDirection bridge = MetroDirection(
          platform: "",
          stops: 0,
          travelMode: "WALKING",
          vehicleType: "BRIDGE",
          metro: "DMRC",
          departureName: departureName,
          arrivalName: direction.last.name,
          currLineName: metroData["data"][line]["name"],
          currLineColour:
              int.parse("0XFF${metroData["data"][line]["colour_code"]}"),
          interchange: direction.last.name,
          duration: "",
          headsign: "",
          stations: const []);
      routeDirections.add(bridge);
    }
  }

  print("Distance covered: $routeDistance");
  fare = fareCalculator(routeDistance.toInt());
  print("₹${fare.toString()}");

    int totalStations = 0;
    int totalInterchanges = 0;
    //Total Stations
    for (var direction in routeDirections) {
      totalStations+=direction.stops;
    }
    
    //Total interchanges
    for (var direction in routeDirections) {
      totalInterchanges+=direction.stations.isEmpty?1:0;
    }
  metro = MetroRoute(
      routeCost: "₹${fare.toString()}", route: routeDirections, data: '',
      totalInterchanges: totalInterchanges,
      totalStations: totalStations
      );
  return metro;
}

double calculateDistance(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) {
  double distanceInMeters = Geolocator.distanceBetween(
      startLatitude, startLongitude, endLatitude, endLongitude);

  // Convert distance to kilometers
  double distanceInKm = distanceInMeters / 1000;

  return distanceInKm;
}

int fareCalculator(int distance,
    {bool isAirport = false, int airportStations = 0}) {
  int fare = 0;
  if (isAirport == true) {
    if (airportStations == 2) {
      fare = 20;
    } else if (airportStations == 3) {
      fare = 30;
    } else if (airportStations == 4) {
      fare = 40;
    } else if (airportStations == 5) {
      fare = 50;
    } else if (airportStations == 6) {
      fare = 60;
    }
  } else {
    if (distance < 2) {
      fare = 10;
    } else if (2 <= distance && distance < 5) {
      fare = 20;
    } else if (5 <= distance && distance < 12) {
      fare = 30;
    } else if (12 <= distance && distance < 21) {
      fare = 40;
    } else if (21 <= distance && distance < 32) {
      fare = 50;
    } else if (distance >= 32) {
      fare = 60;
    }
  }
  return fare;
}
