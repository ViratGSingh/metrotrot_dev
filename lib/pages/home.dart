import 'dart:async';

import 'package:app/controllers/home.dart';
import 'package:app/widgets/general/card.dart';
import 'package:app/widgets/home/nearestFrom.dart';
import 'package:app/widgets/home/status.dart';
import 'package:app/widgets/search/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiredash/wiredash.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 1),
              () {
                /// adding elements in list after [1 seconds] delay
                /// to mimic network call
                ///
                /// Remember: setState is necessary so that
                /// build method will run again otherwise
                /// list will not show all elements

                controller.checkUserLocation();

                // showing snackbar
              },
            );
          },
          child: Container(
            color: Colors.white,
            // constraints: BoxConstraints(minWidth: 300, maxWidth: 450),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return controller.isOnline.value == true
                            ? OnlineStatus()
                            : OfflineStatus();
                      }),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: Icon(Icons.feedback),
                          color: Color(0xffFFBB23),
                          onPressed: () {
                            Wiredash.of(context)
                                .show(inheritMaterialTheme: true);
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/metrotrot_header.png",
                      fit: BoxFit.cover,
                      width: 250,
                      height: 50,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: SearchAppBar(),
                  ),
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: FromStation(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return NumberInfoCard(
                            title: "Distance",
                            type: "nearest",
                            info: controller.fromDistance.value,
                            measure: "metres",
                            isLoading: controller.isFromUpdating.value,
                          );
                        }),
                        Obx(() {
                          return InfoCard(
                            title: "Operational",
                            type: "operational_from",
                            info: controller.fromOpen.value,
                            isLoading: controller.isFromUpdating.value,
                          );
                        })
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return InfoCard(
                            title: "Rating",
                            type: "rating",
                            info: controller.fromRating.value,
                            isLoading: controller.isFromUpdating.value,
                          );
                        }),
                        Obx(() {
                          return InfoCard(
                            title: "Reviews",
                            type: "reviews",
                            info: controller.fromTotalRatings.value,
                            isLoading: controller.isFromUpdating.value,
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
