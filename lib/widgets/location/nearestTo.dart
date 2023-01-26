import 'package:app/controllers/home.dart';
import 'package:app/controllers/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ToStation extends GetView<LocationController> {
  const ToStation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(minHeight: 120),
            decoration: BoxDecoration(
                color: const Color(0xff004AAD),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return controller.isToUpdating.value == false
                            ? Text("Nearest Station",
                                style: GoogleFonts.notoSans(
                                    color: Colors.white, fontSize: 16))
                            : Container(
                                height: 16,
                                width: MediaQuery.of(context).size.width / 4,
                                child: LinearProgressIndicator(),
                              );
                      }),
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: 13,
                      //   child: Icon(
                      //     Icons.directions_subway,
                      //     color: Color(0xffFFBB23),
                      //     size: 16,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return controller.isToUpdating.value == false
                          ? Text(controller.toStation.value,
                              style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))
                          : Container(
                              height: 28,
                              width: 2 * MediaQuery.of(context).size.width / 3,
                              child: LinearProgressIndicator(),
                            );
                    }),
                    Obx(() {
                      return controller.isToUpdating.value == false
                          ? Text(controller.toStationAddress.value,
                              style: GoogleFonts.notoSans(
                                  color: Colors.white, fontSize: 16))
                          : Container(
                              height: 28,
                              width: 2 * MediaQuery.of(context).size.width / 3,
                              child: LinearProgressIndicator(),
                            );
                    })
                  ],
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: -12,
          //   right: -12,
          //   child: Container(
          //     height: 30,
          //     width: 30,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         Get.to(ToSearchPage());
          //       },
          //       child: Icon(
          //         Icons.edit,
          //         size: 18,
          //       ),
          //       style: ElevatedButton.styleFrom(
          //         padding: EdgeInsets.zero,
          //         backgroundColor: Color(0xffFFBB23),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15),
          //           //border radius equal to or more than 50% of width
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ]);
  }
}
