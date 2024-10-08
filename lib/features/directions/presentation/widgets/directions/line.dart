import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetroLine extends StatefulWidget {
  int colourCode;
  String lineName;
  List stationsData;
  String departure;
  String arrival;
  bool isHindi;
  MetroLine({
    super.key,
    required this.colourCode,
    required this.lineName,
    required this.stationsData,
    required this.departure,
    required this.arrival,
    required this.isHindi
  });
  @override
  State<MetroLine> createState() => _MetroLineState();
}

class _MetroLineState extends State<MetroLine> {
  //ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    //scrollController.dispose();
    super.dispose();
  }

  // void scrollToPosition() {
  //   int depIndex = 0;
  //   widget.stationsData.forEach((station) {
  //     if (station["name"] == widget.departure) {
  //       depIndex = widget.stationsData.indexOf(station);
  //     }
  //   });
  //   print(depIndex);
  //   scrollController.animateTo(
  //     depIndex * 30, // The position to scroll to
  //     duration: Duration(milliseconds: 500), // The duration of the animation
  //     curve: Curves.ease, // The easing curve for the animation
  //   );
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to a certain position after the widget is built
      //scrollToPosition();
    });
    super.initState();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    // final c = Get.put(
    //   HomeController(),
    // );
    int i = 0;
    List data = widget.stationsData.sublist(1,widget.stationsData.length);

    return widget.stationsData.length==1?
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
                        SizedBox(
                          //color: Colors.black,
                          height: 20,
                          child: VerticalDivider(
                            color: Color(widget.colourCode),
                            thickness: 8,
                          ),
                        ),
                        Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 18,
                                color: Color(widget.colourCode),
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
                              widget.departure,
                              style: GoogleFonts.notoSans(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          
                            ),
                    
                  
                ],
              ),
            )
    :
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ListTileTheme(
          contentPadding: const EdgeInsets.all(0),
          dense: true,
          horizontalTitleGap: 0.0,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          shape: const RoundedRectangleBorder(),
          style: ListTileStyle.drawer,
          child: ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            title: Padding(
              padding: const EdgeInsets.only(left:8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 4),
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          //color: Colors.black,
                          height: 50,
                          child: VerticalDivider(
                            color: Color(widget.colourCode),
                            thickness: 8,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: isExpanded == true ? 20 : 0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 18,
                                color: Color(widget.colourCode),
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
                    height: 50,
                    padding: EdgeInsets.only(top: isExpanded == true ? 20 : 0),
                    width: MediaQuery.of(context).size.width / 2,
                    child: FittedBox(
                      child: isExpanded == true
                          ? Text(
                              widget.departure,
                              style: GoogleFonts.notoSans(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          : Text(
                              widget.isHindi?"सभी ${widget.stationsData.length} स्टॉप दिखाएं":"Stations in Between",
                              style: GoogleFonts.notoSans(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ,
                    ),
                  ),
                ],
              ),
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            children: data.map((station) {
              if (i == (widget.stationsData.length - 1)) {
                i += 1;
                return Padding(
                  padding: const EdgeInsets.only(left:8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 4),
                        height: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              //color: Colors.black,
                              height: 40,
                              child: VerticalDivider(
                                color: Color(widget.colourCode),
                                thickness: 8,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 18,
                                    color: Color(widget.colourCode),
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
                        alignment: Alignment.center,
                        height: 40,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          station[widget.isHindi?"native_name":"name"],
                          style: GoogleFonts.notoSans(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                i += 1;
                return Padding(
                  padding: const EdgeInsets.only(left:8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 4),
                        height: 30,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              //color: Colors.black,
                              height: 30,
                              child: VerticalDivider(
                                color: Color(widget.colourCode),
                                thickness: 8,
                              ),
                            ),
                            Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 18,
                                    color: Color(widget.colourCode),
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
                        alignment: Alignment.center,
                        height: 30,
                        child: Text(
                          station[widget.isHindi?"native_name":"name"],
                          style: GoogleFonts.notoSans(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
