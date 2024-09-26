import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionInter extends StatelessWidget {
  String interchangeStation;
  String prevLine;
  int prevLineColor;
  String currLine;
  int currLineColor;
  String header;
  bool isBridge;
  String newStation;
  bool isBridgeEnd;
  bool isHindi;
  DirectionInter(
      {super.key,
      required this.isBridge,
      required this.header,
      required this.interchangeStation,
      required this.newStation,
      required this.prevLine,
      required this.prevLineColor,
      required this.currLine,
      required this.currLineColor,
      this.isBridgeEnd=false,
      this.isHindi=false
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: isBridgeEnd==true?[
        Container(
          padding: const EdgeInsets.fromLTRB(10,15,0,15),
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: isBridge==false?AssetImage("assets/images/interchange.png"):AssetImage("assets/images/nearest.png"),
              //     alignment: Alignment.bottomCenter),
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.grey.shade300)
              // boxShadow: [
              //   BoxShadow(
              //     offset: Offset(0, 4),
              //     blurRadius: 4,
              //     color: Colors.black.withOpacity(0.25),
              //   )
              // ]
              ),
          child: Row(
            children: [
              const Icon(Icons.swap_vert),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(header, style: GoogleFonts.notoSans(fontSize: 14)),
                SizedBox(
                  width: 2*MediaQuery.of(context).size.width/3+40,
                  child: isBridge==false?Text(
                    isHindi?"$currLine की ओर चलें":"Move towards $currLine",
                    style:
                        GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                  ): Text(
                    isHindi?"$newStation की ओर चलें":"Move towards $newStation",
                    style:
                        GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                // Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //     Text(
                //     interchangeStation,
                //     style:
                //         GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                //   Icon(Icons.arrow_downward_outlined),
                //   Text(
                //     newStation,
                //     style:
                //         GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.bold),
                //   )
                //   ]),
                
                // Padding(
                //   padding: EdgeInsets.only(top: 0),
                //   child: Container(
                //     padding: EdgeInsets.all(5),
                //     //height: 30,
                //     decoration: BoxDecoration(
                //       color: Color(currLineColor),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     child: Text(
                //       currLine,
                //       style: GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
                //     ),
                //   ),
                // ),
              ]),
            ],
          ),
        ),
        Padding(
              padding: const EdgeInsets.only(left:10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 4),
                    height: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Container(
                        //   //color: Colors.black,
                        //   height: 20,
                        //   child: VerticalDivider(
                        //     color: Colors.red,
                        //     thickness: 8,
                        //   ),
                        // ),
                        Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 18,
                                color: Color(prevLineColor),
                                //color: Color(lineColor),
                              ),
                              const Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.white,
                                //color: Color(lineColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 20,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                              newStation,
                              style: GoogleFonts.notoSans(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          
                            ),
                    
                  
                ],
              ),
            )
      ]:[
        Container(
          padding: const EdgeInsets.fromLTRB(10,15,0,15),
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: isBridge==false?AssetImage("assets/images/interchange.png"):AssetImage("assets/images/nearest.png"),
              //     alignment: Alignment.bottomCenter),
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.grey.shade300)
              // boxShadow: [
              //   BoxShadow(
              //     offset: Offset(0, 4),
              //     blurRadius: 4,
              //     color: Colors.black.withOpacity(0.25),
              //   )
              // ]
              ),
          child: Row(
            children: [
              const Icon(Icons.swap_vert),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(header, style: GoogleFonts.notoSans(fontSize: 14)),
                SizedBox(
                  width: 2*MediaQuery.of(context).size.width/3+40,
                  child: isBridge==false?Text(
                    isHindi?"$currLine की ओर चलें":"Move towards $currLine",
                    style:
                        GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                  ): Text(
                    isHindi?"$newStation की ओर चलें":"Move towards $newStation",
                    style:
                        GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                // Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //     Text(
                //     interchangeStation,
                //     style:
                //         GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                //   Icon(Icons.arrow_downward_outlined),
                //   Text(
                //     newStation,
                //     style:
                //         GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.bold),
                //   )
                //   ]),
                
                // Padding(
                //   padding: EdgeInsets.only(top: 0),
                //   child: Container(
                //     padding: EdgeInsets.all(5),
                //     //height: 30,
                //     decoration: BoxDecoration(
                //       color: Color(currLineColor),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     child: Text(
                //       currLine,
                //       style: GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
                //     ),
                //   ),
                // ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
