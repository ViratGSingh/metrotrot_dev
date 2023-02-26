import 'package:app/features/from_search/presentation/pages/from_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/features/home/presentation/pages/home.dart';

class RequestPermission extends StatelessWidget {
  const RequestPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/location_permission.gif",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Where are you?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Location services are required to make your metro journey more simpler and efficient than ever before.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                            fontSize: 16, color: Theme.of(context).hintColor),
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 52)),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xffFFBB23),
                      ),
                    ),
                    onPressed: () async {
                      await Permission.location
                          .request()
                          .then((locationStatus) {
                        if (locationStatus.isGranted ||
                            locationStatus.isLimited) {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        } else {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const FromSearchPage(),
                            ),
                          );
                        }
                      });

                      // else if (locationStatus.isDenied == true) {
                      //   Navigator.push<void>(
                      //     context,
                      //     MaterialPageRoute<void>(
                      //       builder: (BuildContext context) =>
                      //           const RequestPermissionAgain(),
                      //     ),
                      //   );
                      // } else {
                      //   print(locationStatus);
                      // }
                      // controller.getUserLocation();
                      // Get.to(HomePage());
                    },
                    child: Text(
                      "Enable Location",
                      style: GoogleFonts.notoSans(fontSize: 18),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     style: ButtonStyle(
                //       padding: MaterialStateProperty.all<EdgeInsets>(
                //         EdgeInsets.all(0),
                //       ),
                //       shape:
                //           MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(26),
                //         ),
                //       ),
                //       fixedSize: MaterialStateProperty.all(Size(
                //           MediaQuery.of(context).size.width / 2.2, 52)),
                //       backgroundColor: MaterialStateProperty.all(
                //         Colors.white,
                //       ),
                //     ),
                //     onPressed: () async {
                //       // Get.to(FromSearchPage());
                //     },
                //     child: Text("Continue",
                //         style: GoogleFonts.notoSans(
                //             fontSize: 18, color: Colors.black))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestPermissionAgain extends StatelessWidget {
  const RequestPermissionAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                // Get.back();
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
                        // Get.back();
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
