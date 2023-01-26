import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineStatus extends GetView<HomeController> {
  const OnlineStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: () {
          controller.isOnline.value = false;
          controller.getUserLocation();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(90, 20),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.wifi_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text(
              "Online",
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class OfflineStatus extends GetView<HomeController> {
  const OfflineStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: () {
          controller.isOnline.value = true;
          controller.getUserLocation();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(90, 20),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.wifi_off_outlined,
              color: Colors.red,
              size: 20,
            ),
            SizedBox(width: 2),
            Text(
              "Offline",
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
