import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningPopup extends StatelessWidget {
  final String title;
  final String message;
  final Function actionFunc;
  final String action;
  WarningPopup(
      {super.key,
      required this.title,
      required this.message,
      required this.action,
      required this.actionFunc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.all(0),
      icon: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xFFF7B500),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 72.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   Icons.error_outline,
          //   color: Colors.red,
          //   size: 64.0,
          // ),
          //SizedBox(height: 16.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width / 3, 45),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Close",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 3, 45)),
              backgroundColor: MaterialStateProperty.all(
                Color(0xFFF7B500),
              )),
          onPressed: () => actionFunc(),
          child: Text(
            action,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
