import 'package:app/bindings.dart';
import 'package:app/controllers/location.dart';
import 'package:app/pages/directions.dart';
import 'package:app/widgets/general/card.dart';
import 'package:app/widgets/location/nearestTo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends GetView<LocationController> {
  String mainText;
  String secondaryText;
  bool isOnline;

  LocationPage({
    super.key,
    required this.mainText,
    required this.secondaryText,
    this.isOnline = true,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          leadingWidth: 40,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          // leading: Padding(
          //   padding: EdgeInsets.only(left: 0),
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Get.back();
          //     },
          //   ),
          // ),
          titleSpacing: 0,
          title: Text(
            "Location",
            style: GoogleFonts.notoSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          color: Colors.white,
          // constraints: BoxConstraints(minWidth: 300, maxWidth: 450),
          child: Center(
            child: ListView(shrinkWrap: true, children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      secondaryText,
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 52)),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xffFFBB23),
                    ),
                  ),
                  onPressed: () async {
                    String condition = "online";
                    if (isOnline == false) {
                      condition = "offline";
                      Get.to(
                        DirectionsPage(),
                        arguments: [
                          condition,
                          controller.offDirections,
                          controller.fromData,
                          controller.searchData,
                          controller.toData
                        ],
                        binding: DirectionsBinding(),
                      );
                    } else {
                      //controller.isDirLoading.value = true;

                      Get.to(
                        DirectionsPage(),
                        arguments: [
                          condition,
                          controller.apiData,
                          controller.fromData,
                          controller.searchData,
                          controller.toData
                        ],
                        binding: DirectionsBinding(),
                      );
                      //controller.connectivityResult =
                      //    await (Connectivity().checkConnectivity());
                      //await controller.getRoute();

                      //controller.isDirLoading.value = false;
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions),
                        Text(
                          "Directions",
                          style: GoogleFonts.notoSans(fontSize: 22),
                        )
                      ]),
                ),
              ),

              // Container(
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     "assets/images/metrotrot_header.png",
              //     fit: BoxFit.cover,
              //     width: 250,
              //     height: 50,
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: ToStation(),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return NumberInfoCard(
                        title: "Distance",
                        type: "nearest",
                        info: controller.toDistance.value,
                        measure: "metres",
                        isLoading: controller.isToUpdating.value,
                      );
                    }),
                    Obx(() {
                      return InfoCard(
                        title: "Operational",
                        type: "operational_to",
                        info: controller.toOpen.value,
                        isLoading: controller.isToUpdating.value,
                      );
                    })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return InfoCard(
                          title: "Rating",
                          type: "rating",
                          info: controller.toRating.value,
                          isLoading: controller.isToUpdating.value,
                        );
                      }),
                      Obx(() {
                        return InfoCard(
                          title: "Reviews",
                          type: "reviews",
                          info: controller.toTotalRatings.value,
                          isLoading: controller.isToUpdating.value,
                        );
                      })
                    ],
                  ),
                ),
              ),

              // Obx(() {
              //   return controller.guideUser(controller.guideState.value);
              // })
            ]),
          ),
        ),
      ),
    );
  }
}
