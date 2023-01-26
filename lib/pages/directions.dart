import 'package:app/controllers/directions.dart';
import 'package:app/controllers/home.dart';
import 'package:app/widgets/errors/directions.dart';
import 'package:app/widgets/general/directions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionsPage extends GetView<DirectionsController> {
  DirectionsPage({
    super.key,
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
          leading: Padding(
            padding: EdgeInsets.only(left: 0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                //controller.search.close();
                Get.back();
              },
            ),
          ),
          titleSpacing: 0,
          title: Text(
            "Directions",
            style: GoogleFonts.notoSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: Obx(() {
          return controller.isDirLoading.value == false
              ? controller.directions.isBlank == false
                  ? Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Center(
                        child: MetroDirections(),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(15),
                      child: ErrorDirections(),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
    ;
  }
}
