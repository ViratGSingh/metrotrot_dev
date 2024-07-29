import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/widgets/popups/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final String initialToSearch;
  ToSearchPage(
      {super.key,
      this.isOffline = false,
      this.userId = "",
      this.initialToSearch="",
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ToSearchCubit>().initMixpanel();
    });
    
    toSearchController.text = widget.initialToSearch;
      context.read<ToSearchCubit>().searchLimitChecked = false;
      context.read<ToSearchCubit>().initialisationAds();
    context.read<ToSearchCubit>().getSearchRecommendations(
        //widget.userId,
        //widget.fromMetro.placeId,
        toSearchController.text,
        widget.isOffline,
        widget.lat,
        widget.lng,
        context
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ToSearchCubit, ToSearchState>(
        listener: (context, state) {
          
          if(state.isRewardGranted==true){
                showDialog(
              context: context,
              builder: (BuildContext context) {
                return SuccessPopup(
                  title: "Congratulations!",
                  message:
                      "You've unlocked advanced online search capabilities for faster and more accurate results. Enjoy your enhanced search experience.",
                  action: "Continue",
                  actionFunc: () async {
                    Navigator.pop(context);
                    //launchUrl(Uri.parse("https://www.threads.net/@viratgsingh"));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => const HomePa,
                    //   ),
                    // );
                  },
                );
              });

                state.isRewardGranted = false;
          }

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
                          widget.lng,
                          context
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
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "Suggested Places",
                      style: TextStyle(color: Colors.grey),
                    ),
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
                              ValueNotifier<bool> isFavourite =
                                  ValueNotifier(recom.isFavourite);
                              return ValueListenableBuilder(
                                  valueListenable: isFavourite,
                                  builder: (context, value, _) {
                                    return Card(
                                      child: ListTile(
                                        style: ListTileStyle.list,
                                        onTap: () async {
                                           if (isFavourite.value == true) {
                                          context
                                              .read<ToSearchCubit>()
                                              .mixpanel
                                              .track(
                                                  "tappedFavDestSearchRecomPlace");
                                        } else {
                                          context
                                              .read<ToSearchCubit>()
                                              .mixpanel
                                              .track("tappedDestSearchRecomPlace");
                                        }
                                          // context
                                          //     .read<ToSearchCubit>()
                                          //     .saveDestinationInfo(
                                          //         widget.userId,
                                          //         widget.isGuest,
                                          //         widget.fromMetro,
                                          //         destinationId,
                                          //         mainAddr,
                                          //         secondaryAddr,
                                          //         widget.lat,
                                          //         widget.lng);
                                          // Navigator.push<void>(
                                          //   context,
                                          //   MaterialPageRoute<void>(
                                          //     builder: (BuildContext context) =>
                                          //         LocationPage(
                                          //       isOffline: false,
                                          //       toPlaceId: destinationId,
                                          //       fromMetro: widget.fromMetro,
                                          //       name: mainAddr,
                                          //       distance: widget.distance,
                                          //       address: secondaryAddr,
                                          //       fromLat: widget.lat,
                                          //       fromLng: widget.lng,
                                          //     ),
                                          //   ),
                                          // );
                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  HomePage(
                                                isFromSearch: false,
                                                placeId: destinationId,
                                                isFromOffline: false,
                                              ),
                                            ),
                                          );
                                        },
                                        contentPadding: EdgeInsets.all(0),
                                        leading: const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 15),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0xff004aad),
                                          ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                              if (isFavourite.value == true) {
                                          context
                                              .read<ToSearchCubit>()
                                              .mixpanel
                                              .track(
                                                  "removedFavDestSearchRecomPlace");
                                        } else {
                                          context
                                              .read<ToSearchCubit>()
                                              .mixpanel
                                              .track("addedFavDestSearchRecomPlace");
                                        }
                                            context
                                                .read<ToSearchCubit>()
                                                .updateDestFavRecommendation(
                                                    recom, !isFavourite.value);
                                            isFavourite.value =
                                                !isFavourite.value;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                top: 15,
                                                bottom: 15,
                                                right: 15),
                                            child: Icon(
                                              isFavourite.value == true
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: isFavourite.value == true
                                                  ? Colors.red
                                                  : Colors.black,
                                              // color:
                                              //     Color(int.parse("0xff${recom["line_color_code"]}")),
                                            ),
                                          ),
                                        ),
                                        subtitle: Text(
                                          secondaryAddr,
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.grey.shade700),
                                        ),
                                        title: Text(
                                          mainAddr,
                                          style: GoogleFonts.notoSans(
                                              fontSize: 14),
                                        ),
                                      ),
                                    );
                                  });
                            }).toList(),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  Divider(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "Suggested Stations",
                      style: TextStyle(color: Colors.grey),
                    ),
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
                                    context
                                              .read<ToSearchCubit>()
                                              .mixpanel
                                              .track(
                                                  "tappedDestSearchRecomStation");
                                    // context
                                    //     .read<ToSearchCubit>()
                                    //     .saveDestinationInfo(
                                    //         widget.userId,
                                    //         widget.isGuest,
                                    //         widget.fromMetro,
                                    //         destinationId,
                                    //         mainAddr,
                                    //         secondaryAddr,
                                    //         widget.lat,
                                    //         widget.lng);
                                    // Navigator.push<void>(
                                    //   context,
                                    //   MaterialPageRoute<void>(
                                    //     builder: (BuildContext context) =>
                                    //         LocationPage(
                                    //       isOffline: true,
                                    //       toPlaceId: destinationId,
                                    //       fromMetro: widget.fromMetro,
                                    //       name: mainAddr,
                                    //       distance: widget.distance,
                                    //       address: secondaryAddr,
                                    //       fromLat: widget.lat,
                                    //       fromLng: widget.lng,
                                    //     ),
                                    //   ),
                                    // );
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            HomePage(
                                          isFromSearch: false,
                                          placeId: destinationId,
                                          isFromOffline: true,
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
                                        fontSize: 12,
                                        color: Colors.grey.shade700),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
