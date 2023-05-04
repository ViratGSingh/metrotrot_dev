// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/login/presentation/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/features/destination/presentation/cubit/dest_metro_cubit.dart';
import 'package:app/features/destination/presentation/widgets/card.dart';
import 'package:app/features/destination/presentation/widgets/nearestTo.dart';
import 'package:app/features/directions/presentation/pages/directions.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/destination/presentation/widgets/warnings/main.dart';

class LocationPage extends StatefulWidget {
  final String toPlaceId;
  final FromMetro fromMetro;
  final double fromLat;
  final double fromLng;
  final String name;
  final String address;
  final String distance;
  final bool isOffline;
  const LocationPage({
    Key? key,
    required this.toPlaceId,
    required this.fromMetro,
    required this.fromLat,
    required this.fromLng,
    required this.name,
    required this.address,
    required this.distance,
    required this.isOffline,
  }) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    context.read<DestMetroCubit>().getDestNearbyMetro(
        widget.toPlaceId,
        widget.fromMetro.placeId,
        widget.fromLat,
        widget.fromLng,
        widget.isOffline);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestMetroCubit, DestMetroState>(
      listener: (context, state) {
        // TODO: implement listener

        //
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 3,
              backgroundColor: Colors.white,
              leadingWidth: 40,
              iconTheme: IconThemeData(color: Colors.black),
              automaticallyImplyLeading: true,
              // leading: Padding(
              //   padding: EdgeInsets.only(left: 0),
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     onPressed: () {
              //       Get.back();
              //     },
              //   ),
              // ),
              titleSpacing: 0,
              title: Text(
                "Location",
                style: GoogleFonts.notoSans(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: Container(
              color: Colors.white,
              // constraints: BoxConstraints(minWidth: 300, maxWidth: 450),
              child: Center(
                child: ListView(shrinkWrap: true, children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.address,
                          style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width / 3, 48)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () async {
                            if (state.isOffline == true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return WarningPopup(
                                    title: "Warning!",
                                    message:
                                        "You are currently in offline mode, please make sure online mode is enabled at home.",
                                    action: "To Home",
                                    actionFunc: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const HomePage(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              context.read<DestMetroCubit>().changeDestStatus(
                                  widget.fromMetro.placeId,
                                  widget.toPlaceId,
                                  state.isOffline,
                                  context);
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  state.isLiked == false
                                      ? Icons.favorite_outline_outlined
                                      : Icons.favorite,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  state.isLiked == false ? "Like" : "Liked",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(Size(
                                2 * MediaQuery.of(context).size.width / 3 - 40,
                                48)),
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xffFFBB23),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    DirectionsPage(
                                        fromMetro: widget.fromMetro,
                                        destMetro: state.metro,
                                        destName: widget.name,
                                        destAddress: widget.address,
                                        fromDistance: widget.distance,
                                        toDistance: state.distance,
                                        isOffline: widget.isOffline,
                                        destination: widget.name),
                              ),
                            );
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.directions_subway_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Directions",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: ToStation(
                        header: "Nearest Station",
                        isOffline: state.isOffline,
                        isUpdating: state.status == DestMetroStatus.loading
                            ? true
                            : false,
                        name: state.metro.name,
                        address: state.metro.vicinity),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberInfoCard(
                          title: "Distance",
                          type: "nearest",
                          info: state.distance,
                          measure: state.distance != "N/A" ? "metres" : "",
                          isLoading: state.status == DestMetroStatus.loading ||
                                  state.status == DestMetroStatus.initial
                              ? true
                              : false,
                        ),
                        InfoCard(
                          title: "Operational",
                          type: "operational_to",
                          info: state.metro.businessStatus,
                          isLoading: state.status == DestMetroStatus.loading ||
                                  state.status == DestMetroStatus.initial
                              ? true
                              : false,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoCard(
                            title: "Rating",
                            type: "rating",
                            info: state.metro.rating.toString(),
                            isLoading:
                                state.status == DestMetroStatus.loading ||
                                        state.status == DestMetroStatus.initial
                                    ? true
                                    : false,
                          ),
                          InfoCard(
                            title: "Reviews",
                            type: "reviews",
                            info: state.metro.userRatingsTotal.toString(),
                            isLoading:
                                state.status == DestMetroStatus.loading ||
                                        state.status == DestMetroStatus.initial
                                    ? true
                                    : false,
                          )
                        ],
                      ),
                    ),
                  ),

                  // Obx(() {
                  //   return controller.guideUser(controller.guideState.value);
                  // })
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
