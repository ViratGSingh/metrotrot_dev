import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MetroInstruction extends GetView {
  String instruction;
  MetroInstruction({
    Key? key,
    required this.instruction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(
      HomeController(),
    );
    int i = 0;
    RxBool isEnd = false.obs;
    List data = [];

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(bottom: 5),
            //   child: Text(
            //     "Instruction",
            //     style: GoogleFonts.notoSans(
            //         fontSize: 18, fontWeight: FontWeight.bold),
            //   ),
            // ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: instruction,
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
                ),
              ]),
            ),
          ],
        ));
  }
}
