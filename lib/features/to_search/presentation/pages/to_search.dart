import 'package:app/features/destination/presentation/cubit/dest_metro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/destination/presentation/pages/destination.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/presentation/cubit/to_search_cubit.dart';

class ToSearchPage extends StatefulWidget {
  final String userId;
  final bool isGuest;
  final bool isOffline;
  final FromMetro fromMetro;
  final double lat;
  final double lng;
  final String distance;
  ToSearchPage(
      {super.key,
      this.isOffline = false,
      this.userId = "",
      required this.isGuest,
      required this.distance,
      required this.fromMetro,
      required this.lat,
      required this.lng});

  @override
  State<ToSearchPage> createState() => _ToSearchPageState();
}

class _ToSearchPageState extends State<ToSearchPage> {
  TextEditingController toSearchController = TextEditingController();

  @override
  void initState() {
    context.read<ToSearchCubit>().getSearchRecommendations(
        //widget.userId,
        //widget.fromMetro.placeId,
        toSearchController.text,
        widget.isOffline,
        widget.lat,
        widget.lng
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ToSearchCubit, ToSearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              titleSpacing: 0,
              backgroundColor: Colors.white,
              title: Container(
                width: MediaQuery.of(context).size.width - 100,
                child: TextFormField(
                    controller: toSearchController,
                    autofocus: true,
                    onChanged: (location) {
                      context.read<ToSearchCubit>().getSearchRecommendations(
                          //widget.userId,
                          //widget.fromMetro.placeId,
                          toSearchController.text,
                          widget.isOffline,
                          widget.lat,
                          widget.lng
                          );
                      // if (location.isNotEmpty == true) {

                      // }
                    },
                    decoration: InputDecoration(
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                        hintText: "Where to?",
                        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: Colors.blue),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Get.back();
                  // controller.search.close();
                },
                icon: Image.asset(
                  "assets/images/metrotrot.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                  child: Text("Suggested Places", style: TextStyle(color: Colors.grey),),
                ),
                
                  state.placeStatus == ToSearchPlaceStatus.loaded
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                      
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                            children: state.locations.map((recom) {
                              String mainAddr;
                              String secondaryAddr;
                              String destinationId;
                              mainAddr = recom.main;
                              secondaryAddr = recom.secondary;
                              destinationId = recom.placeId;
                              return Card(
                                child: ListTile(
                                  style: ListTileStyle.list,
                                  onTap: () async {
                                    context.read<ToSearchCubit>().saveDestinationInfo(
                                        widget.userId,
                                        widget.isGuest,
                                        widget.fromMetro,
                                        destinationId,
                                        mainAddr,
                                        secondaryAddr,
                                        widget.lat,
                                        widget.lng);
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => LocationPage(
                                          isOffline: false,
                                          toPlaceId: destinationId,
                                          fromMetro: widget.fromMetro,
                                          name: mainAddr,
                                          distance: widget.distance,
                                          address: secondaryAddr,
                                          fromLat: widget.lat,
                                          fromLng: widget.lng,
                                        ),
                                      ),
                                    );
                                  },
                                  contentPadding: EdgeInsets.all(0),
                                  leading: const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 15),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xff004aad),
                                    ),
                                  ),
                                  // trailing: Padding(
                                  //   padding: const EdgeInsets.only(bottom: 10, right: 15),
                                  //   child: Icon(
                                  //     Icons.directions_transit,
                                  //     color: Colors.blue,
                                  //     // color:
                                  //     //     Color(int.parse("0xff${recom["line_color_code"]}")),
                                  //   ),
                                  // ),
                                  subtitle: Text(
                                    secondaryAddr,
                                    style: GoogleFonts.notoSans(
                                        fontSize: 12, color: Colors.grey.shade700),
                                  ),
                                  title: Text(
                                    mainAddr,
                                    style: GoogleFonts.notoSans(fontSize: 14),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                        Divider(height: 10),
                      Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                  child: Text("Suggested Stations",style: TextStyle(color: Colors.grey),),
                ),
                state.stationStatus == ToSearchStationStatus.loaded
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: state.stations.map((recom) {
                            String mainAddr;
                            String secondaryAddr;
                            String destinationId;
                            mainAddr = recom.main;
                            secondaryAddr = recom.secondary;
                            destinationId = recom.placeId;
                            return Card(
                              child: ListTile(
                                style: ListTileStyle.list,
                                onTap: () async {
                                    context.read<ToSearchCubit>().saveDestinationInfo(
                                        widget.userId,
                                        widget.isGuest,
                                        widget.fromMetro,
                                        destinationId,
                                        mainAddr,
                                        secondaryAddr,
                                        widget.lat,
                                        widget.lng);
                                  Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => LocationPage(
                                          isOffline: true,
                                          toPlaceId: destinationId,
                                          fromMetro: widget.fromMetro,
                                          name: mainAddr,
                                          distance: widget.distance,
                                          address: secondaryAddr,
                                          fromLat: widget.lat,
                                          fromLng: widget.lng,
                                        ),
                                      ),
                                    );
                                },
                                contentPadding: EdgeInsets.all(5),
                                
                                leading: const Padding(
                                  padding: EdgeInsets.only(top: 5, left: 15),
                                  child: Icon(
                                    Icons.directions_subway_filled_outlined,
                                    
                                      color: Color(0xff004aad),
                                  ),
                                ),
                                // trailing: Padding(
                                //   padding: const EdgeInsets.only(bottom: 10, right: 15),
                                //   child: Icon(
                                //     Icons.search,
                                //     color: Colors.blue,
                                //     // color:
                                //     //     Color(int.parse("0xff${recom["line_color_code"]}")),
                                //   ),
                                // ),
                                subtitle: Text(
                                  secondaryAddr,
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12, color: Colors.grey.shade700),
                                ),
                                title: Text(
                                  mainAddr,
                                  style: GoogleFonts.notoSans(fontSize: 14),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                    ):const Center(
                        child: CircularProgressIndicator(),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
