import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String message;
  final Function actionFunc;
  final String action;
  const SuccessPopup(
      {super.key,
      required this.title,
      required this.message,
      required this.action,
      required this.actionFunc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: const EdgeInsets.all(0),
      icon: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Color(0xFF5C913B),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10) ),
      
        ),
        child: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: 72.0,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
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
        // TextButton(
        //   style: ButtonStyle(
        //     fixedSize: MaterialStateProperty.all(
        //       Size(MediaQuery.of(context).size.width / 3, 45),
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: Text(
        //     "Close",
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.notoSans(
        //         color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        //   ),
        // ),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(2*MediaQuery.of(context).size.width / 3, 45)),
              backgroundColor: MaterialStateProperty.all(
              const Color(0xFF5C913B),//  Color(0xFFF2C423),
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