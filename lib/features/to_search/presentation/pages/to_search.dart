import 'dart:async';

import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/widgets/popups/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/presentation/cubit/to_search_cubit.dart';
import 'package:lottie/lottie.dart';

class ToSearchPage extends StatefulWidget {
  final String userId;
  final bool isGuest;
  final bool isOffline;
  final FromMetro fromMetro;
  final double lat;
  final double lng;
  final String distance;
  final String initialToSearch;
  const ToSearchPage(
      {super.key,
      this.isOffline = false,
      this.userId = "",
      this.initialToSearch = "",
      required this.isGuest,
      required this.distance,
      required this.fromMetro,
      required this.lat,
      required this.lng});

  @override
  State<ToSearchPage> createState() => _ToSearchPageState();
}

ValueNotifier<bool> _isTyping = ValueNotifier(false);
Timer? _typingTimer;

class _ToSearchPageState extends State<ToSearchPage> {
  TextEditingController toSearchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ToSearchCubit>().checkUserPremiumStatus();
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
        context);
    _isTyping.addListener(() {
      if (_isTyping.value == true) {
        // User has started typing
        print("User started typing");
        print("");
      } else {
        // User has stopped typing
        print("User stopped typing");
        print("");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _cancelTypingTimer();
    super.dispose();
  }

  void _startTypingTimer() {
    _cancelTypingTimer();
    _typingTimer = Timer(const Duration(milliseconds: 400), () {
      _isTyping.value = false;
      context.read<ToSearchCubit>().getSearchRecommendations(
          //widget.userId,
          //widget.fromMetro.placeId,
          toSearchController.text,
          widget.isOffline,
          widget.lat,
          widget.lng,
          context);
    });
  }

  void _cancelTypingTimer() {
    _typingTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ToSearchCubit, ToSearchState>(
        listener: (context, state) {
          if (state.isRewardGranted == true) {
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
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              centerTitle: true,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    //color: Colors.tealAccent,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 52,
                        child: TextFormField(
                            controller: toSearchController,
                            autofocus: true,
                            onChanged: (location) {
                              _isTyping.value = true;
                              _startTypingTimer();
                              // if (location.isNotEmpty == true) {
                  
                              // }
                            },
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: Theme.of(context)
                                    .inputDecorationTheme
                                    .hintStyle,
                                hintText: "Where to?",
                                contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 0)),
                            style: Theme.of(context).textTheme.bodyMedium,
                            cursorColor: Colors.blue),
                      ),
                      const SizedBox(width: 6),
                      IconButton(
                          onPressed: () {
                            toSearchController.text = "";
                            context.read<ToSearchCubit>().getSearchRecommendations(
                                //widget.userId,
                                //widget.fromMetro.placeId,
                                toSearchController.text,
                                widget.isOffline,
                                widget.lat,
                                widget.lng,
                                context);
                          },
                          icon: const Icon(Icons.cancel_outlined, color: Colors.black))
                    ],
                  ),
                ),
              ),
              // leading: IconButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              //   icon: const Icon(
              //     Icons.arrow_back,
              //     color: Colors.black,
              //   ),
              // ),
            ),
            body: state.placeStatus == ToSearchPlaceStatus.loaded
                      ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  //   child: Text(
                  //     "Suggested Places",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  state.placeStatus == ToSearchPlaceStatus.loaded
                      ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
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
                                                .track(
                                                    "tappedDestSearchRecomPlace");
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
                                                builder:
                                                    (BuildContext context) =>
                                                        HomePage(
                                                  isFromSearch: false,
                                                  placeId: destinationId,
                                                  isFromOffline: false,
                                                ),
                                              ),
                                            );
                                          
                                        },
                                        contentPadding: const EdgeInsets.all(5),
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
                                                  .track(
                                                      "addedFavDestSearchRecomPlace");
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
                                        subtitle: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                          child: Text(
                                            secondaryAddr,
                                            style: GoogleFonts.notoSans(
                                                fontSize: 12,
                                                color: Colors.grey.shade700),
                                          ),
                                        ),
                                        title: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                          child: Text(
                                            mainAddr,
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14),
                                          ),
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
                  // Divider(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  //   child: Text(
                  //     "Suggested Stations",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  state.stationStatus == ToSearchStationStatus.loaded
                      ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
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
                                        .track("tappedDestSearchRecomStation");
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
                                  contentPadding: const EdgeInsets.all(5),

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
                                  subtitle: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                    child: Text(
                                      secondaryAddr,
                                      style: GoogleFonts.notoSans(
                                          fontSize: 12,
                                          color: Colors.grey.shade700),
                                    ),
                                  ),
                                  title: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                    child: Text(
                                      mainAddr,
                                      style: GoogleFonts.notoSans(fontSize: 14),
                                    ),
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
            ):Center(
                        child: SizedBox(
                                  height: MediaQuery.of(context).size.height/2,
                                  child:
                                            Lottie.asset('assets/animations/dest_search_loading.json'),
                                ),
                              
                      ),
          );
        },
      ),
    );
  }
}
