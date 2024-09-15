// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:app/features/directions/presentation/widgets/directions/directions.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:lottie/lottie.dart';

class DirectionsPage extends StatefulWidget {
  final FromMetro fromMetro;
  final DestMetro destMetro;
  final String destination;
  final String fromDistance;
  final String toDistance;
  final String destName;
  final String destAddress;
  final bool isOffline;
  const DirectionsPage({
    Key? key,
    required this.fromMetro,
    required this.destMetro,
    required this.destination,
    required this.fromDistance,
    required this.toDistance,
    required this.destName,
    required this.destAddress,
    required this.isOffline,
  }) : super(key: key);

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DirectionsCubit>().initMixpanel();
    });
    context.read<DirectionsCubit>().getDirections(
        widget.fromMetro,
        widget.destMetro,
        widget.destName,
        widget.destAddress,
        widget.isOffline,
        UserPriorityStatus.stops);

    super.initState();
  }

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectionsCubit, DirectionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              "Directions",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                //controller.search.close();
                //Get.back();
              },
            ),
          ),
          body: DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    leading: null,
                    leadingWidth: 0,
                    elevation: 0,
                    centerTitle: true,
                    title: null,
                    toolbarHeight: 0,
                    bottom: TabBar(
                        indicatorColor: Color(0xFFFFBB23),
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (value) {
                          setState(() {
                            tabIndex = value;
                          });
                          if (tabIndex == 0) {
                            context
                                .read<DirectionsCubit>()
                                .mixpanel
                                .track("pressedLessStationsDirectionsBtn");
                            context.read<DirectionsCubit>().getDirections(
                                widget.fromMetro,
                                widget.destMetro,
                                widget.destName,
                                widget.destAddress,
                                widget.isOffline,
                                UserPriorityStatus.stops);
                          } else if (tabIndex == 1) {
                            context
                                .read<DirectionsCubit>()
                                .mixpanel
                                .track("pressedLessInterchangesDirectionsBtn");
                            context.read<DirectionsCubit>().getDirections(
                                widget.fromMetro,
                                widget.destMetro,
                                widget.destName,
                                widget.destAddress,
                                widget.isOffline,
                                UserPriorityStatus.interchanges);
                          }
                        },
                        tabs: [
                          Tab(
                            icon: Text(
                              "Less Stations",
                              style: TextStyle(
                                  color: tabIndex == 0
                                      ? Color(0xFFFFBB23)
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                              icon: Text(
                            "Less Walking",
                            style: TextStyle(
                                color: tabIndex == 1
                                    ? Color(0xFFFFBB23)
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                        ]),
                  ),
                  body: TabBarView(
                    children: [
                      state.status == DirectionsStatus.loaded
                          ? SingleChildScrollView(
                              child: Container(
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 15),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 2)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color(0xFFFF1616),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  height: 20,
                                                  child: Text(
                                                    widget.fromMetro.fromName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.notoSans(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 30,
                                              padding:
                                                  EdgeInsets.only(left: 11),
                                              child: Image.asset(
                                                  "assets/images/dotted_line.png"),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color(0xFF004AAD),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  height: 20,
                                                  child: Text(
                                                    widget.destMetro.destName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.notoSans(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 5),
                                      child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                       "Price",
                                                        style: GoogleFonts.notoSans(
                                                            fontSize: 16,
                                                            color: Colors.black),
                                                      ),

                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(children: [
                                                      
                                                       TextSpan(
                                                        text: state
                                                            .routeData.routeCost.split('').first,
                                                        style: GoogleFonts.notoSans(
                                                          fontSize: 22,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: state
                                                            .routeData.routeCost.replaceAll("₹", ""),
                                                        style: GoogleFonts.notoSans(
                                                          fontSize: 32,
                                                          color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(20,0,0,5),
                                                 child: Row(
                                                   children: [
                                                     RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(children: [
                                                            TextSpan(
                                                             text:"Stations: ",
                                                              style: GoogleFonts.notoSans(
                                                                  fontSize: 14,
                                                                  color: Colors.black),
                                                            ),
                                                            TextSpan(
                                                              text: state
                                                                  .routeData.totalStations.toString(),
                                                              style: GoogleFonts.notoSans(
                                                                fontSize: 18,
                                                                color: Colors.black,
                                                                  fontWeight:
                                                                      FontWeight.bold
                                                              ),
                                                            )
                                                          ]),
                                                        ),
                                                        Container(
                                                          height: 18,
                                                          child: VerticalDivider(color: Colors.grey,)),
                                                 
                                                        RichText(
                                                      textAlign: TextAlign.center,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                         text:"Interchanges: ",
                                                          style: GoogleFonts.notoSans(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        TextSpan(
                                                          text: state
                                                              .routeData.totalInterchanges.toString(),
                                                          style: GoogleFonts.notoSans(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                              fontWeight:
                                                                  FontWeight.bold
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                                                           
                                                   ],
                                                 ),
                                               ),
                                        ],
                                      ),
                                    ),
                                    MetroDirections(
                                        mixpanel: context
                                            .read<DirectionsCubit>()
                                            .mixpanel,
                                        priority: state.priority,
                                        destMetro: widget.destMetro,
                                        fromDistance: widget.fromDistance,
                                        toDistance: widget.toDistance,
                                        routeCost: state.routeData.routeCost,
                                        directions: state.routeData.route,
                                        destination: widget.destination),
                                  ],
                                ),
                              ),
                            )
                          // : Padding(
                          //     padding: EdgeInsets.all(15),
                          //     child: ErrorDirections(),
                          //   )
                          : Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Lottie.asset(
                                    'assets/animations/train_loading.json'),
                              ),
                            ),
                      state.status == DirectionsStatus.loaded
                          ? SingleChildScrollView(
                              child: Container(
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 15),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 2)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color(0xFFFF1616),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  height: 20,
                                                  child: Text(
                                                    widget.fromMetro.fromName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.notoSans(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 30,
                                              padding:
                                                  EdgeInsets.only(left: 11),
                                              child: Image.asset(
                                                  "assets/images/dotted_line.png"),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color(0xFF004AAD),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  height: 20,
                                                  child: Text(
                                                    widget.destMetro.destName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.notoSans(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 5),
                                      child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                       "Price",
                                                        style: GoogleFonts.notoSans(
                                                            fontSize: 16,
                                                            color: Colors.black),
                                                      ),

                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(children: [
                                                      
                                                       TextSpan(
                                                        text: state
                                                            .routeData.routeCost.split('').first,
                                                        style: GoogleFonts.notoSans(
                                                          fontSize: 22,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: state
                                                            .routeData.routeCost.replaceAll("₹", ""),
                                                        style: GoogleFonts.notoSans(
                                                          fontSize: 32,
                                                          color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(20,0,0,5),
                                                 child: Row(
                                                   children: [
                                                     RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(children: [
                                                            TextSpan(
                                                             text:"Stations: ",
                                                              style: GoogleFonts.notoSans(
                                                                  fontSize: 14,
                                                                  color: Colors.black),
                                                            ),
                                                            TextSpan(
                                                              text: state
                                                                  .routeData.totalStations.toString(),
                                                              style: GoogleFonts.notoSans(
                                                                fontSize: 18,
                                                                color: Colors.black,
                                                                  fontWeight:
                                                                      FontWeight.bold
                                                              ),
                                                            )
                                                          ]),
                                                        ),
                                                        Container(
                                                          height: 18,
                                                          child: VerticalDivider(color: Colors.grey,)),
                                                 
                                                        RichText(
                                                      textAlign: TextAlign.center,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                         text:"Interchanges: ",
                                                          style: GoogleFonts.notoSans(
                                                              fontSize: 14,
                                                              color: Colors.black),
                                                        ),
                                                        TextSpan(
                                                          text: state
                                                              .routeData.totalInterchanges.toString(),
                                                          style: GoogleFonts.notoSans(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                              fontWeight:
                                                                  FontWeight.bold
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                                                           
                                                   ],
                                                 ),
                                               ),
                                        ],
                                      ),
                                    ),
                                    MetroDirections(
                                        mixpanel: context
                                            .read<DirectionsCubit>()
                                            .mixpanel,
                                        priority: state.priority,
                                        destMetro: widget.destMetro,
                                        fromDistance: widget.fromDistance,
                                        toDistance: widget.toDistance,
                                        routeCost: state.routeData.routeCost,
                                        directions: state.routeData.route,
                                        destination: widget.destination),
                                  ],
                                ),
                              ),
                            )
                          // : Padding(
                          //     padding: EdgeInsets.all(15),
                          //     child: ErrorDirections(),
                          //   )
                          : Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Lottie.asset(
                                    'assets/animations/train_loading.json'),
                              ),
                            ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
