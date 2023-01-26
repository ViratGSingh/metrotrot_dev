import 'package:app/controllers/home.dart';
import 'package:app/pages/from_search.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermission extends GetView<HomeController> {
  RequestPermission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                Column(
                  children: [
                    Image.asset("assets/images/metrotrot.png", height: 150),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text("Where are you?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                              fontSize: 40,
                              color: Colors.amber,
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      "Location services are required to make your metro journey more simpler and efficient than ever before.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                          fontSize: 18, color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 2.2, 52)),
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xffFFBB23),
                          ),
                        ),
                        onPressed: () async {
                          await Permission.location.request();
                          controller.getUserLocation();
                          Get.to(HomePage());
                        },
                        child: Text("Enable Location",
                            style: GoogleFonts.notoSans(fontSize: 18))),
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 2.2, 52)),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          Get.to(FromSearchPage());
                        },
                        child: Text("Continue",
                            style: GoogleFonts.notoSans(
                                fontSize: 18, color: Colors.black))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestPermissionAgain extends GetView<HomeController> {
  RequestPermissionAgain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return SafeArea(
      child: SizedBox.expand(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.shrink(),
                Column(
                  children: [
                    Image.asset("assets/images/metrotrot.png", height: 150),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Where are you?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.amber,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Location services is required to know the nearest station from your current location.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width - 30, 52)),
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xffFFBB23),
                        ),
                      ),
                      onPressed: () async {
                        await Permission.location.request();
                        Get.back();
                      },
                      child: const Text(
                        "Enable Location",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
