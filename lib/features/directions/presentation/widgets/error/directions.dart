import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDirections extends StatelessWidget {
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
          "Error",
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
              fontSize: 18, color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
