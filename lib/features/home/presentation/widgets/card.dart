// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
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
                image: AssetImage("assets/images/$type.png"), fit: BoxFit.cover),
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
              padding: EdgeInsets.only(bottom: 5),
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
        height: MediaQuery.of(context).size.height / 4 - 25,
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
              padding: EdgeInsets.only(bottom: 5),
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

class LineInfoCard extends StatelessWidget {
  final String title;
  final String type;
  final String info;
  final List<String> names;
  final List<String> startStations;
  final List<String> endStations;
  final List<String> hexcodes;
  final bool isLoading;
  LineInfoCard(
      {Key? key,
      required this.title,
      required this.type,
      required this.info,
      required this.isLoading,
      required this.names,
      required this.startStations,
      required this.endStations,
      required this.hexcodes})
      : super(key: key);

  final ValueNotifier<int> lineIndex = ValueNotifier(0); 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height / 4 - 25,
          //height: 80,
          padding: const EdgeInsets.all(15),
          // constraints: BoxConstraints(
          //     //minWidth: 150,
          //     //minHeight: 200,
          //     //maxWidth: 200,
          //     //maxHeight: 150
          //     ),
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage("assets/images/$type.png"), fit: BoxFit.fill),
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
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Text(
                      names.length > 1 ? "Lines" : "Line",
                      style: GoogleFonts.notoSans(
                          color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(minHeight: 100, maxHeight: 130),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return CarouselSlider(
                        options: CarouselOptions(
                          height: constraints.maxHeight,
                          viewportFraction: 1,
                          autoPlay: names.length==1?false:true,
                          enableInfiniteScroll: names.length==1?false:true,
                          onPageChanged: (index, reason) {
                            
                            lineIndex.value = index;
                          },
                        ),
                        items: names.map((name) {
                          int index = names.indexOf(name);
                          return Container(
                            //color: Colors.black,
                            //height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
              
                              mainAxisSize: MainAxisSize.min,
                                  children: [
                                    isLoading == false
                                        ? Text(
                                            name,
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
                                    SizedBox(height: 2),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
              
                              mainAxisSize: MainAxisSize.min,
                                      children: [
                                        isLoading == false
                                            ? Container(
                                              width: MediaQuery.of(context).size.width/2,
                                              child: Text(
                                                  startStations[index],
                                                  style: GoogleFonts.notoSans(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                            )
                                            : Container(
                                                height: 28,
                                                width: MediaQuery.of(context).size.width/2,
                                                child: LinearProgressIndicator(),
                                              ),
                                              Icon(
                                                Icons.swap_vert,
                                                color: Colors.grey,
                                              ),
                                        
                                        isLoading == false
                                            ? Container(
                                              width: MediaQuery.of(context).size.width/2,
                                              child: Text(
                                                  endStations[index],
                                                  style: GoogleFonts.notoSans(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                            )
                                            : Container(
                                                height: 28,
                                                width: 60,
                                                child: LinearProgressIndicator(),
                                              ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  child: Image.asset("assets/images/metro_line.png",color: Color(int.parse("0xFF${hexcodes[index]}")),),
                                )
                                //Icon(Icons.directions_subway_filled_outlined, size: 80, color: Color(int.parse("0xFF${hexcodes[index]}")),)
                              ],
                            ),
                          );
                        }).toList());
                  }
                ),
              ),
            Visibility(
              visible: names.length>1?true:false,
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  ValueListenableBuilder(
                valueListenable: lineIndex,
                builder: (context,int value,_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:List.generate(names.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.circle, color:value==index?Colors.amber:Colors.grey, size:10),
                    );
                  }) );
                }
              )
                ],
              ),
            ),
            
            ],
          )),
    );
  }
}
