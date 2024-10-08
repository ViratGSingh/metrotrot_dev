// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/from_search/presentation/pages/from_search.dart';

class FromStation extends StatelessWidget {
  final bool isUpdating;
  final String name;
  final String address;
  final bool isOffline;
  const FromStation(
      {super.key,
      required this.isUpdating,
      required this.name,
      required this.address,
      this.isOffline = false});

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
          constraints: const BoxConstraints(minHeight: 120),
          decoration: BoxDecoration(
              color: const Color(0xffFF1616),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isUpdating == false
                        ? Text(
                            isOffline == false ? "Nearest Metro" : "Last Seen",
                            style: GoogleFonts.notoSans(
                                color: Colors.white, fontSize: 12),
                          )
                        : SizedBox(
                            height: 16,
                            width: MediaQuery.of(context).size.width / 4,
                            child: const LinearProgressIndicator(),
                          ),
                    SizedBox(
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
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color(0xffFFBB23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              //border radius equal to or more than 50% of width
                            )),
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                        ),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      : SizedBox(
                          height: 28,
                          width: 2 * MediaQuery.of(context).size.width / 3,
                          child: const LinearProgressIndicator(),
                        ),
                  isUpdating == false
                      ? Text(
                          address,
                          style: GoogleFonts.notoSans(
                              color: Colors.white, fontSize: 16),
                        )
                      : Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 16,
                          width: 2 * MediaQuery.of(context).size.width / 3,
                          child: const LinearProgressIndicator(),
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
