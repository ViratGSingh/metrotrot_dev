import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchLimitReachedPopup extends StatelessWidget {
  final String title;
  final String message;
  final Function actionFunc;
  final String action;
  const SearchLimitReachedPopup(
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
          color: Color(0xFFFFBB23),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: const Icon(
          Icons.notifications_active,
          color: Colors.white,
          size: 60.0,
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
          // Image.asset("assets/images/allow_notifications_graphic.png",
          //     height: 120),
          const SizedBox(
            height: 5,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                color: Colors.grey.shade700,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
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
        // ElevatedButton(
        //   style: ButtonStyle(
        //       fixedSize: MaterialStateProperty.all(
        //           Size(MediaQuery.of(context).size.width / 3, 45)),
        //       backgroundColor: MaterialStateProperty.all(
        //         Colors.white, //  Color(0xFFF2C423),
        //       )),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text(
        //     "Later",
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.notoSans(
        //         color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        //   ),
        // ),
        // ElevatedButton(
        //   style: ButtonStyle(
        //       fixedSize: MaterialStateProperty.all(
        //           Size(MediaQuery.of(context).size.width / 3, 45)),
        //       backgroundColor: MaterialStateProperty.all(
        //         const Color(0xFF734F96), //  Color(0xFFF2C423),
        //       )),
        //   onPressed: () => actionFunc(),
        //   child: Text(
        //     "Continue",
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.notoSans(
        //         color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        //   ),
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                    // minimumSize: MaterialStateProperty.all(
                    //     Size(MediaQuery.of(context).size.width/4, 45)),
                    // maximumSize: MaterialStateProperty.all(
                    //     Size(MediaQuery.of(context).size.width/2, 45)),
                    ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Later",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    // minimumSize: MaterialStateProperty.all(
                    //     Size(MediaQuery.of(context).size.width/4, 45)),
                    maximumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2, 45)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFFFBB23), //  Color(0xFFF2C423),
                    )),
                onPressed: () => actionFunc(),
                child: Text(
                  "Watch Ad",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
