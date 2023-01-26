import 'package:app/controllers/directions.dart';
import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class ErrorDirections extends GetView<DirectionsController> {
  ErrorDirections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/no_directions.png",
            width: 2 * MediaQuery.of(context).size.width / 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: Text("Track ends here",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                  fontSize: 40,
                  color: Colors.amber,
                  fontWeight: FontWeight.w500)),
        ),
        Text(
          controller.errorMessage,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
              fontSize: 18, color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
