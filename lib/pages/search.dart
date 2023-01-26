import 'dart:convert';
import 'package:app/bindings.dart';
import 'package:app/controllers/home.dart';
import 'package:app/models/directions.dart';
import 'package:app/pages/location.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends GetView<HomeController> {
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
                  controller: controller.toController,
                  focusNode: controller.fromFocus,
                  autofocus: true,
                  onChanged: (location) {
                    if (location.length >= 3 || location.length == 0) {
                      controller.getSearchRecommendations(location);
                    }
                  },
                  decoration: InputDecoration(
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: "Where to?",
                      contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Colors.blue),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
                controller.search.close();
              },
              icon: Image.asset(
                "assets/images/metrotrot.png",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          body: Obx(() {
            return controller.isSearchLoading.value == false
                ? ListView(
                    children: controller.searchRecoms.map((recom) {
                      String mainAddr;
                      String secondaryAddr;
                      Map<String, dynamic> destResp;
                      Map<String, dynamic> dirResp;

                      if (controller.isOnline.value == false) {
                        Directions offDir = recom;
                        mainAddr = offDir.destMain.toString();
                        secondaryAddr = offDir.destSecondary.toString();
                      } else {
                        if (recom.runtimeType == Directions) {
                          Directions offDir = recom;
                          mainAddr = offDir.destMain.toString();
                          secondaryAddr = offDir.destSecondary.toString();
                        } else {
                          mainAddr =
                              recom["structured_formatting"]["main_text"];
                          secondaryAddr =
                              recom["structured_formatting"]["secondary_text"];
                        }
                      }
                      return Card(
                        child: ListTile(
                          style: ListTileStyle.list,
                          onTap: () {
                            // controller.toStation.value =
                            //     recom["structured_formatting"]["main_text"];
                            controller.searchMain = mainAddr;
                            controller.searchSecondary = secondaryAddr;
                            String condition = "online";
                            if (controller.isOnline.value == false) {
                              Directions offDir = recom;
                              destResp = json.decode(offDir.toData.toString());
                              dirResp =
                                  json.decode(offDir.directions.toString());

                              //controller.getOffNearestMetro(destResp);
                              condition = "offline";
                              Get.to(
                                LocationPage(
                                  mainText: mainAddr,
                                  secondaryText: secondaryAddr,
                                  isOnline: false,
                                ),
                                arguments: [
                                  condition,
                                  destResp,
                                  dirResp,
                                  controller.apiData,
                                  controller.fromData,
                                  {"main": mainAddr, "secondary": secondaryAddr}
                                ],
                                binding: LocationBinding(),
                              );
                              //controller.getOffRoute(dirResp);
                            } else {
                              String destinationId;
                              if (controller.toController.value.text.isEmpty ==
                                  true) {
                                Directions offDir = recom;
                                destResp =
                                    json.decode(offDir.toData.toString());
                                dirResp =
                                    json.decode(offDir.directions.toString());

                                condition = "offline";
                                Get.to(
                                  LocationPage(
                                    mainText: mainAddr,
                                    secondaryText: secondaryAddr,
                                    isOnline: false,
                                  ),
                                  arguments: [
                                    condition,
                                    destResp,
                                    dirResp,
                                    controller.apiData,
                                    controller.fromData,
                                    {
                                      "main": mainAddr,
                                      "secondary": secondaryAddr
                                    }
                                  ],
                                  binding: LocationBinding(),
                                );
                              } else {
                                destinationId = recom["place_id"];
                                //controller.getNearestMetro(destinationId);
                                Get.to(
                                  LocationPage(
                                      mainText: mainAddr,
                                      secondaryText: secondaryAddr),
                                  arguments: [
                                    condition,
                                    destinationId,
                                    controller.apiData,
                                    controller.fromData,
                                    {
                                      "main": mainAddr,
                                      "secondary": secondaryAddr
                                    }
                                  ],
                                  binding: LocationBinding(),
                                );
                              }
                            }
                          },
                          contentPadding: EdgeInsets.all(0),
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 5, left: 15),
                            child: Icon(
                              Icons.location_on,
                              color: Color(0xff004aad),
                            ),
                          ),
                          subtitle: Text(
                            secondaryAddr,
                            style: GoogleFonts.notoSans(
                                fontSize: 14, color: Colors.grey.shade700),
                          ),
                          title: Text(mainAddr,
                              style: GoogleFonts.notoSans(fontSize: 16)),
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
