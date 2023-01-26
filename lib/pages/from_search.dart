import 'dart:convert';
import 'package:app/bindings.dart';
import 'package:app/controllers/home.dart';
import 'package:app/models/directions.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FromSearchPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.toFocus.requestFocus();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            title: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: TextFormField(
                  controller: controller.fromSearchController,
                  focusNode: controller.fromSearchFocus,
                  autofocus: true,
                  onChanged: (location) {
                    if (location.length >= 3 || location.isEmpty == true) {
                      controller.getFromSearchRecommendations(location);
                    }
                    //controller.getSearchRecommendations(location);
                    //print(location);
                    // Iterable recommendations = results.where((option) {
                    //   return option["name"]
                    //       .toLowerCase()
                    //       .replaceAll(" ", "_")
                    //       .contains(
                    //         location.removeAllWhitespace
                    //             .toLowerCase()
                    //             .replaceAll(" ", "_"),
                    //       );
                    // });
                    // print(recommendations);
                  },
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //   gapPadding: 10,
                      //   borderSide: BorderSide.none,
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide.none,
                      // ),
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white),
                      // ),

                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.green),
                      // ),
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: "Where are you?",
                      contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Colors.blue),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
                controller.search.close();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Obx(() {
            return controller.isSearchLoading.value == false
                ? ListView(
                    children: controller.fromSearchRecoms.map((recom) {
                      String mainAddr;
                      String secondaryAddr;
                      Map<String, dynamic> fromResp;
                      String destinationId;

                      if (controller.isOnline.value == false) {
                        Directions offDir = recom;
                        destinationId = offDir.fromId.toString();

                        fromResp = json.decode(offDir.fromData.toString());
                        mainAddr = fromResp["results"][0]["name"];
                        secondaryAddr = fromResp["results"][0]["vicinity"];
                        destinationId = offDir.fromId.toString();
                      } else {
                        if (controller
                                .fromSearchController.value.text.isEmpty ==
                            true) {
                          if (recom is Directions) {
                            Directions offDir = recom;
                            fromResp = json.decode(offDir.fromData.toString());
                            mainAddr = fromResp["results"][0]["name"];
                            secondaryAddr = fromResp["results"][0]["vicinity"];
                            destinationId = offDir.fromId.toString();
                          } else {
                            mainAddr =
                                recom["structured_formatting"]["main_text"];
                            secondaryAddr = recom["structured_formatting"]
                                ["secondary_text"];
                            destinationId = recom["place_id"];
                          }
                        } else {
                          mainAddr =
                              recom["structured_formatting"]["main_text"];
                          secondaryAddr =
                              recom["structured_formatting"]["secondary_text"];
                          destinationId = recom["place_id"];
                        }
                      }

                      return Card(
                        child: ListTile(
                          style: ListTileStyle.list,
                          onTap: () {
                            if (controller.isOnline.value == false) {
                              Directions offDir = recom;
                              fromResp =
                                  json.decode(offDir.fromData.toString());
                              String lineColor = fromResp["results"][0]
                                  ["icon_background_color"];
                              controller.fromStationColor.value =
                                  int.parse(lineColor.replaceAll("#", "0xff"));
                              controller.fromOpen.value = fromResp["results"][0]
                                          ["business_status"] ==
                                      "OPERATIONAL"
                                  ? "Yes"
                                  : "No";
                              controller.fromRating.value =
                                  fromResp["results"][0]["rating"].toString();
                              controller.fromTotalRatings.value =
                                  fromResp["results"][0]["user_ratings_total"]
                                      .toString();
                              controller.fromDistance.value =
                                  fromResp["results"][0]["distance"]
                                      .toStringAsFixed(0);
                              controller.fromData = fromResp;
                              controller.fromHeader.value = "Last Seen";
                              controller.fromStation.value =
                                  fromResp["results"][0]["name"];
                              controller.fromStationAddress.value =
                                  fromResp["results"][0]["vicinity"];
                              controller.fromPlaceId.value =
                                  fromResp["results"][0]["place_id"];
                              controller.getSearchRecommendations("");
                              Get.to(HomePage());
                            } else {
                              if (controller.fromSearchController.value.text
                                      .isEmpty ==
                                  true) {
                                Directions offDir = recom;
                                fromResp =
                                    json.decode(offDir.fromData.toString());
                                controller.fromPlaceId.value =
                                    fromResp["results"][0]["place_id"];
                                controller.fromStation.value =
                                    fromResp["results"][0]["name"];
                                controller.fromStationAddress.value =
                                    fromResp["results"][0]["vicinity"];
                                controller.fromDistance.value =
                                    fromResp["results"][0]["distance"]
                                        .toStringAsFixed(0);
                                String lineColor = fromResp["results"][0]
                                    ["icon_background_color"];
                                controller.fromStationColor.value = int.parse(
                                    lineColor.replaceAll("#", "0xff"));
                                controller.fromOpen.value = fromResp["results"]
                                            [0]["business_status"] ==
                                        "OPERATIONAL"
                                    ? "Yes"
                                    : "No";
                                controller.fromRating.value =
                                    fromResp["results"][0]["rating"].toString();
                                controller.fromTotalRatings.value =
                                    fromResp["results"][0]["user_ratings_total"]
                                        .toString();
                                controller.fromData = fromResp;
                                controller.fromHeader.value = "Nearest Station";
                                controller.getSearchRecommendations("");
                                Get.to(HomePage());
                              } else {
                                mainAddr =
                                    recom["structured_formatting"]["main_text"];
                                secondaryAddr = recom["structured_formatting"]
                                    ["secondary_text"];
                                destinationId = recom["place_id"];
                                controller.getFromNearestMetro(destinationId);
                                Get.to(HomePage(), binding: HomeBinding());
                              }
                            }
                          },
                          contentPadding: EdgeInsets.all(0),
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 5, left: 15),
                            child: Icon(
                              Icons.location_on,
                              color: Color(0xffFF1616),
                            ),
                          ),
                          // trailing: Padding(
                          //   padding: const EdgeInsets.only(bottom: 10, right: 15),
                          //   child: Icon(
                          //     Icons.directions_transit,
                          //     color: Colors.blue,
                          //     // color:
                          //     //     Color(int.parse("0xff${recom["line_color_code"]}")),
                          //   ),
                          // ),
                          subtitle: Text(
                            secondaryAddr,
                            style: GoogleFonts.notoSans(
                                fontSize: 14, color: Colors.grey.shade700),
                          ),
                          title: Text(
                            mainAddr,
                            style: GoogleFonts.notoSans(fontSize: 16),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          })),
    );
  }
}
