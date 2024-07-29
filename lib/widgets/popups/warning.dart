import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningPopup extends StatelessWidget {
  final String title;
  final String message;
  final Color popupColor;
  final Function actionFunc;
  final String action;
  final String cancelText;
  final IconData popupIcon;
  const WarningPopup(
      {super.key,
      required this.title,
      required this.popupColor,
      required this.message,
      required this.action,
      required this.popupIcon,
      required this.actionFunc,
      this.cancelText="Close"
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
        child: Icon(
          popupIcon,
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
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
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