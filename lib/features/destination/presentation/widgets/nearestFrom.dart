// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/from_search/presentation/pages/from_search.dart';

class FromStation extends StatelessWidget {
  final String header;
  final bool isUpdating;
  final String name;
  final String address;
  final bool isOffline;
  const FromStation(
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
          width: MediaQuery.of(context).size.width - 30,
          padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(minHeight: 120),
          decoration: BoxDecoration(
              color: const Color(0xffFF1616),
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
                    isUpdating == false
                        ? Text(
                            header,
                            style: GoogleFonts.notoSans(
                                color: Colors.white, fontSize: 16),
                          )
                        : Container(
                            height: 16,
                            width: MediaQuery.of(context).size.width / 4,
                            child: LinearProgressIndicator(),
                          ),
                    Container(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  FromSearchPage(isOffline: isOffline),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          size: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Color(0xffFFBB23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              //border radius equal to or more than 50% of width
                            )),
                      ),
                    ),
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      : Container(
                          height: 28,
                          width: 2 * MediaQuery.of(context).size.width / 3,
                          child: LinearProgressIndicator(),
                        ),
                  isUpdating == false
                      ? Text(
                          address,
                          style: GoogleFonts.notoSans(
                              color: Colors.white, fontSize: 18),
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 16,
                          width: 2 * MediaQuery.of(context).size.width / 3,
                          child: LinearProgressIndicator(),
                        )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
