import 'dart:ui';

import 'package:app/controllers/directions.dart';
import 'package:app/controllers/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MetroDirections extends GetView<DirectionsController> {
  MetroDirections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    text: controller.routecost,
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ]),
              )),
        ),
        CarouselSlider(
          items: controller.directions
              .map(
                (direction) => Padding(
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
                    child: controller.formatDirection(direction),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              onPageChanged: ((value, CarouselPageChangedReason) {
                controller.currentStep.value = value;
              }),
              scrollPhysics: BouncingScrollPhysics(),
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height / 2),
        ),
        Obx(() {
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller
                  .getCarouselIcons(controller.currentStep.value.toDouble()),
            ),
          );
        }),
        Obx(() {
          return Container(
            padding: const EdgeInsets.only(top: 30),
            width: 2 * MediaQuery.of(context).size.width / 3 + 60,
            height: MediaQuery.of(context).size.height / 4,
            child: controller
                .getInstructions(controller.currentStep.value.toDouble()),
          );
        }),
      ],
    );
  }
}
