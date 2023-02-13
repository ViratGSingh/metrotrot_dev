import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';

class InternetStatus extends StatelessWidget {
  final bool isOffline;
  final Function() tapLogic;
  const InternetStatus(
      {super.key, required this.tapLogic, required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: FlutterSwitch(
          height: 28,
          width: 50,
          duration: Duration(milliseconds: 300),
          value: isOffline == false ? true : false,
          activeColor: Colors.green,
          inactiveColor: Colors.red,
          activeIcon: const Icon(
            Icons.wifi_outlined,
            color: Colors.green,
            size: 20,
          ),
          inactiveIcon: const Icon(
            Icons.wifi_off_outlined,
            color: Colors.red,
            size: 20,
          ),
          onToggle: (bool newValue) {
            tapLogic();
          }),
    );
    // return Padding(
    //   padding: EdgeInsets.only(left: 20),
    //   child: ElevatedButton(
    //     onPressed: tapLogic,
    //     style: ElevatedButton.styleFrom(
    //       fixedSize: Size(90, 20),
    //       padding: EdgeInsets.zero,
    //       backgroundColor: Colors.white,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         isOffline == false
    //             ? const Icon(
    //                 Icons.wifi_outlined,
    //                 color: Colors.green,
    //                 size: 20,
    //               )
    //             : const Icon(
    //                 Icons.wifi_off_outlined,
    //                 color: Colors.red,
    //                 size: 20,
    //               ),
    //         Text(
    //           isOffline == false ? "Online" : "Offline",
    //           style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
    //         )
    //         // :Text(
    //         //   "Offline",
    //         //   style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
