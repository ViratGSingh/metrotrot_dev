import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MetroLine extends StatefulWidget {
  int colourCode;
  String lineName;
  List stationsData;
  MetroLine({
    Key? key,
    required this.colourCode,
    required this.lineName,
    required this.stationsData,
  }) : super(key: key);
  @override
  State<MetroLine> createState() => _MetroLineState();
}

class _MetroLineState extends State<MetroLine> {
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
          child: ListView(
              children: data.map((station) {
            if (i == 0 || i == widget.stationsData.length) {
              i += 1;
              return Padding(
                  padding: EdgeInsets.only(
                      top: i == widget.stationsData.length ? 0 : 20,
                      bottom: i == widget.stationsData.length ? 20 : 0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(5),
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
                      Row(
                        children: [
                          Container(
                            height: 30,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Color(widget.colourCode),
                                    thickness: 8,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 14,
                                        color: Color(widget.colourCode),
                                        //color: Color(lineColor),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 7,
                                        color: Colors.white,
                                        //color: Color(lineColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              station["name"],
                              style: GoogleFonts.notoSans(
                                  fontSize: 14, fontWeight: FontWeight.normal),
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
                    height: 30,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            color: Color(widget.colourCode),
                            thickness: 8,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 14,
                                color: Color(widget.colourCode),
                                //color: Color(lineColor),
                              ),
                              Icon(
                                Icons.circle,
                                size: 7,
                                color: Colors.white,
                                //color: Color(lineColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: Text(
                      station["name"],
                      style: GoogleFonts.notoSans(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              );
            }
          }).toList()),
        );
      },
    );
  }
}
