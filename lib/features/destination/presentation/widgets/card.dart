// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String type;
  final String info;
  final bool isLoading;
  const InfoCard({
    Key? key,
    required this.title,
    required this.type,
    required this.info,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 4 - 20,
        // height: cardHeight,
        constraints: BoxConstraints(
            minWidth: 150, minHeight: 200, maxWidth: 200, maxHeight: 250),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/$type.png"), fit: BoxFit.fill),
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
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: GoogleFonts.notoSans(color: Colors.black, fontSize: 14),
              ),
            ),
            isLoading == false
                ? Text(
                    info,
                    style: GoogleFonts.notoSans(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                : Container(
                    height: 28,
                    width: 60,
                    child: LinearProgressIndicator(),
                  )
          ],
        ));
  }
}

class NumberInfoCard extends StatelessWidget {
  final String title;
  final String type;
  final String info;
  final String measure;
  final bool isLoading;
  const NumberInfoCard({
    Key? key,
    required this.title,
    required this.type,
    required this.info,
    required this.measure,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.height / 4 - 20,
        // height: cardHeight,
        padding: const EdgeInsets.all(15),
        constraints: BoxConstraints(
            minWidth: 150, minHeight: 200, maxWidth: 200, maxHeight: 250),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/$type.png"), fit: BoxFit.fill),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: GoogleFonts.notoSans(color: Colors.black, fontSize: 14),
              ),
            ),
            isLoading == false
                ? Text(
                    info,
                    style: GoogleFonts.notoSans(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                : Container(
                    height: 28,
                    width: 60,
                    child: LinearProgressIndicator(),
                  ),
            isLoading == false
                ? Text(
                    measure,
                    style: GoogleFonts.notoSans(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 20,
                    width: 60,
                    child: LinearProgressIndicator(),
                  )
          ],
        ));
  }
}
