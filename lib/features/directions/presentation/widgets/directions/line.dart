import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MetroLine extends StatefulWidget {
  int colourCode;
  String lineName;
  List stationsData;
  String departure;
  String arrival;
  MetroLine({
    Key? key,
    required this.colourCode,
    required this.lineName,
    required this.stationsData,
    required this.departure,
    required this.arrival,
  }) : super(key: key);
  @override
  State<MetroLine> createState() => _MetroLineState();
}

class _MetroLineState extends State<MetroLine> {
  ScrollController scrollController = ScrollController();
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToPosition() {
    int depIndex = 0;
  widget.stationsData.forEach((station) {
        if(station["name"]==widget.departure){
          depIndex = widget.stationsData.indexOf(station);
        }
    });
    print(depIndex);
    scrollController.animateTo(
      depIndex*30, // The position to scroll to
      duration: Duration(milliseconds: 500), // The duration of the animation
      curve: Curves.ease, // The easing curve for the animation
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Scroll to a certain position after the widget is built
      scrollToPosition();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final c = Get.put(
    //   HomeController(),
    // );
    int i = 0;
    ValueNotifier<bool> isEnd = ValueNotifier<bool>(false);
    List data = widget.stationsData;

    return ValueListenableBuilder(
      valueListenable: isEnd,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                )
              ]),
          child:  Column(
              children: [
                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(widget.colourCode),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(widget.lineName,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 14,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  ToggleSwitch(
                                    minWidth: 60,
                                    minHeight: 30,
                                    cornerRadius: 15,
                                    activeBgColors: [
                                      [Color(0xffFFBB23)],
                                      [Color(0xffFFBB23)]
                                    ],
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.grey,
                                    inactiveFgColor: Colors.white,
                                    initialLabelIndex: isEnd.value == false ? 0 : 1,
                                    totalSwitches: 2,
                                    labels: ['Start', 'End'],
                                    radiusStyle: true,
                                    onToggle: (index) {
                                      if (index == 1) {
                                        i = 0;
                                        isEnd.value = true;
                                        data = widget.stationsData.reversed.toList();
                                      }
                                      if (index == 0) {
                                        i = 0;
                                        isEnd.value = false;
                                        data = widget.stationsData;
                                      }
                                    },
                                  ),
                                ]),
                            
                Container(
                  height: MediaQuery.of(context).size.height / 4 -60,
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                      children: data.map((station) {
                    if (i == 0 || i == widget.stationsData.length) {
                      i += 1;
                      return Padding(
                          padding: EdgeInsets.only(
                              //top: i == widget.stationsData.length ? 0 : 20,
                              bottom: i == widget.stationsData.length ? 20 : 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                            padding: EdgeInsets.only(right: 4),
                                    height: 30,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
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
                                                  Icon(
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
                                      station["name"],
                                      style: GoogleFonts.notoSans(
                                          fontSize: 14, fontWeight: station["name"]==widget.departure || station["name"]==widget.arrival?FontWeight.bold:FontWeight.normal),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    } else {
                      return Row(
                        children: [
                          Container(
                                            padding: EdgeInsets.only(right: 4),
                                    height: 30,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
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
                                                  Icon(
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
                              station["name"],
                              style: GoogleFonts.notoSans(
                                  fontSize: 14, fontWeight:station["name"]==widget.departure || station["name"]==widget.arrival?FontWeight.bold:FontWeight.normal),
                            ),
                          )
                        ],
                      );
                    }
                  }).toList()),
                ),
              ],
            ),
          
        );
      },
    );
  }
}
