import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToStation extends StatelessWidget {
  final String header;
  final bool isUpdating;
  final String name;
  final String address;
  final bool isOffline;
  const ToStation(
      {Key? key,
      required this.header,
      required this.isUpdating,
      required this.name,
      required this.address,
      this.isOffline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(minHeight: 120),
            decoration: BoxDecoration(
                color: const Color(0xff004AAD),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearest Station",
                        style: GoogleFonts.notoSans(
                            color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isUpdating == false
                        ? Text(
                            name,
                            style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Container(
                            height: 28,
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            child: LinearProgressIndicator(),
                          ),
                    isUpdating == false
                        ? Text(address,
                            style: GoogleFonts.notoSans(
                                color: Colors.white, fontSize: 16))
                        : Container(
                            height: 28,
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            child: LinearProgressIndicator(),
                          )
                  ],
                )
              ],
            ),
          ),
        ]);
  }
}
