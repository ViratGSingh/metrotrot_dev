import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PremiumPopup extends StatelessWidget {
  final String title;
  final String message;
  final Color popupColor;
  final Function actionFunc;
  final String action;
  const PremiumPopup(
      {super.key,
      required this.title,
      required this.popupColor,
      required this.message,
      required this.action,
      required this.actionFunc,
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: const EdgeInsets.all(0),
      icon: Container(
        height: 90,
        decoration: BoxDecoration(
          color:popupColor,//  Color(0xFFF2C423),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10) ),
      
        ),
        child: 
            Lottie.asset('assets/animations/rotating_star.json')
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
            "Premium",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          // Text(
          //   message,
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.notoSans(
          //       color: Colors.grey.shade600,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400),
          // ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                // minimumSize: MaterialStateProperty.all(
                //     Size(MediaQuery.of(context).size.width/4, 45)),
                maximumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width/2, 52)),
                backgroundColor: MaterialStateProperty.all(
                popupColor,
                )),
            onPressed: () => actionFunc(),
            child: Text(
              action,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),
          ],
        ),
        
      ],
    );
  }
}