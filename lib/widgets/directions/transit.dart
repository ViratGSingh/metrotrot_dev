import 'dart:math';
import 'package:app/widgets/dialogs/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class DirectionTransit extends GetView {
  String headsign;
  String departure;
  String arrival;
  String currLine;
  String duration;
  int lineColor;
  List stations;
  DirectionTransit({
    Key? key,
    required this.headsign,
    required this.departure,
    required this.arrival,
    required this.currLine,
    required this.lineColor,
    required this.duration,
    required this.stations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/transit.png"),
                    alignment: Alignment.bottomCenter),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Take metro heading",
                    style: GoogleFonts.notoSans(fontSize: 16),
                  ),
                ],
              ),
              Text("Towards $headsign",
                  style: GoogleFonts.notoSans(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.watch_later_outlined,
                    //   size: 16,
                    //   color: Colors.black,
                    // ),
                    Text(
                      "$duration",
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(lineColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    currLine,
                    style:
                        GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.circle,
                            size: 18,
                            color: Color(lineColor),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.circle,
                            size: 18,
                            color: Color(lineColor),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            color: Color(lineColor),
                            thickness: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 86,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            departure,
                            style: GoogleFonts.notoSans(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            arrival,
                            style: GoogleFonts.notoSans(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
              child: Container(
                width: 34,
                height: 34,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.location_searching_outlined,
                    size: 24,
                  ),
                  backgroundColor: Color(0xffFFBB23),
                  onPressed: () async {
                    RxString stationName = "".obs;
                    RxString stationAddr = "".obs;
                    RxBool isUpdating = false.obs;
                    isUpdating.value = true;
                    var status = await Permission.location.request();
                    if (status.isGranted == true) {
                      Get.dialog(Obx(() {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xff004AAD),
                          titlePadding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                          titleTextStyle: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.normal),
                          title: const Text("Nearest Station"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isUpdating.value == false
                                  ? Text(
                                      stationName.value,
                                      style: GoogleFonts.notoSans(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : Container(
                                      height: 28,
                                      width: 2 *
                                          MediaQuery.of(context).size.width /
                                          3,
                                      child: LinearProgressIndicator()),
                              isUpdating.value == false
                                  ? Text(
                                      stationAddr.value,
                                      style: GoogleFonts.notoSans(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  : Container(
                                      padding: EdgeInsets.only(top: 10),
                                      height: 16,
                                      width: 2 *
                                          MediaQuery.of(context).size.width /
                                          3,
                                      child: LinearProgressIndicator(),
                                    )
                            ],
                          ),
                        );
                      }));
                      List<double> distances = [];
                      var locAccuracy = await Geolocator.getLocationAccuracy();
                      var accPos;

                      if (locAccuracy == LocationAccuracyStatus.reduced) {
                        accPos = await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.low);
                      }
                      if (locAccuracy == LocationAccuracyStatus.precise) {
                        accPos = await Geolocator.getCurrentPosition();
                      }
                      for (Map<String, dynamic> station in stations) {
                        double stationLat = station["coordinates"]["lat"];
                        double stationLng = station["coordinates"]["lng"];
                        double userLat = accPos.latitude;
                        double userLng = accPos.longitude;
                        var distance = Geolocator.distanceBetween(
                            userLat, userLng, stationLat, stationLng);
                        distances.add(distance);
                      }
                      double shortestDistance = distances.reduce(min);
                      int nearestIndex = distances.indexOf(shortestDistance);

                      Map<String, dynamic> nearestStation =
                          stations[nearestIndex];
                      stationName.value = nearestStation["name"];
                      stationAddr.value = nearestStation["address"];
                      isUpdating.value = false;
                    } else {
                      Get.generalDialog(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder: (bc, ania, anis) {
                            return RequestPermissionAgain();
                          });
                    }
                  },
                ),
              ),
            ),
          ),
        ]);
  }
}
