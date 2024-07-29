// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:app/features/directions/presentation/widgets/directions/directions.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectionsCubit, DirectionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
              body: state.status == DirectionsStatus.loaded
                  ? SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 4),
                                          blurRadius: 2)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.notoSans(
                                                color:
                                                    Theme.of(context).hintColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      padding: EdgeInsets.only(left: 11),
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
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.notoSans(
                                                color:
                                                    Theme.of(context).hintColor,
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
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(8, 10, 8, 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                            )
                                          ]),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: "Trip Fare: ",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: state.routeData.routeCost,
                                            style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          )
                                        ]),
                                      )),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        "User Priority",
                                        style: GoogleFonts.notoSans(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      autofocus: true,
                                      value: state.priority ==
                                              UserPriorityStatus.stops
                                          ? "0"
                                          : "1",

                                      isExpanded: true,

                                      buttonStyleData: ButtonStyleData(
                                        padding: EdgeInsets.only(left: 8),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                              )
                                            ]),
                                      ),
                                      iconStyleData: IconStyleData(
                                        iconEnabledColor: Color(0xffFFBB23),
                                      ),
                                      onChanged: (value) {
                                        if (value == "0") {
                                          context
                                              .read<DirectionsCubit>()
                                              .mixpanel
                                              .track(
                                                  "pressedLessStationsDirectionsBtn");
                                          context
                                              .read<DirectionsCubit>()
                                              .getDirections(
                                                  widget.fromMetro,
                                                  widget.destMetro,
                                                  widget.destName,
                                                  widget.destAddress,
                                                  widget.isOffline,
                                                  UserPriorityStatus.stops);
                                        } else if (value == "1") {
                                          context
                                              .read<DirectionsCubit>()
                                              .mixpanel
                                              .track(
                                                  "pressedLessInterchangesDirectionsBtn");
                                          context
                                              .read<DirectionsCubit>()
                                              .getDirections(
                                                  widget.fromMetro,
                                                  widget.destMetro,
                                                  widget.destName,
                                                  widget.destAddress,
                                                  widget.isOffline,
                                                  UserPriorityStatus
                                                      .interchanges);
                                        }
                                      },
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: "0",
                                          child: Text(
                                            "Less Stations",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: "1",
                                          child: Text(
                                            "Less Walking",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],

                                      //  Container(
                                      //   width: 40,
                                      //       height: 40,
                                      //       decoration: BoxDecoration(
                                      //           color: Color(0xffFFBB23),
                                      //           borderRadius: BorderRadius.circular(10),
                                      //           boxShadow: [
                                      //             BoxShadow(
                                      //               offset: Offset(0, 4),
                                      //               blurRadius: 4,
                                      //               color: Colors.black.withOpacity(0.25),
                                      //             )
                                      //           ]),
                                      //       child:
                                      //           Icon(Icons.tune, color: Colors.white, size: 24,),
                                      //           ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MetroDirections(
                                mixpanel:context.read<DirectionsCubit>().mixpanel,
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
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
        );
      },
    );
  }
}
