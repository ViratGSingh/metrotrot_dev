// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/features/favourites/presentation/cubit/favourites_cubit.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({
    super.key,
  });

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavouritesCubit>().initMixpanel();
    });
    context.read<FavouritesCubit>().getFavRecommendations();
    super.initState();
  }

  int tabIndex = 0;
  List<SavedFromRecommendation> favSavedFromRecommemdations = [];
  List<SavedToRecommendation> favSavedToRecommemdations = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<FavouritesCubit, FavouritesState>(
          listener: (context, state) {
        favSavedFromRecommemdations = state.fromLocations;
        favSavedToRecommemdations = state.toLocations;
        // TODO: implement listener
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: const Text(
              "Favourites",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                //controller.search.close();
                //Get.back();
              },
            ),
          ),
          body: DefaultTabController(
            length: 2,
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
                      indicatorColor: const Color(0xFFFFBB23),
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (value) {
                        setState(() {
                          tabIndex = value;
                        });
                      },
                      tabs: [
                        Tab(
                          icon: Text(
                            "Sources",
                            style: TextStyle(
                                color: tabIndex == 0
                                    ? const Color(0xFFFFBB23)
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                            icon: Text(
                          "Destinations",
                          style: TextStyle(
                              color: tabIndex == 1
                                  ? const Color(0xFFFFBB23)
                                  : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                      ])),
              body: TabBarView(
                children: [
                  state.pageStatus == FavouritesPlaceStatus.loaded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: state.fromLocations.map((recom) {
                              String mainAddr;
                              String secondaryAddr;
                              mainAddr = recom.main ?? "";
                              secondaryAddr = recom.secondary ?? "";
                              ValueNotifier<bool> isFavourite =
                                  ValueNotifier(recom.isFavourite ?? true);
                              return ValueListenableBuilder(
                                  valueListenable: isFavourite,
                                  builder: (context, value, _) {
                                    return Card(
                                      child: ListTile(
                                        style: ListTileStyle.list,
                                        onTap: () async {
                                          // Navigator.push<void>(
                                          //   context,
                                          //   MaterialPageRoute<void>(
                                          //     builder: (BuildContext context) =>
                                          //         HomePage(
                                          //       isFromSearch: true,
                                          //       placeId: destinationId,
                                          //       isFromOffline: false,
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        contentPadding: const EdgeInsets.all(5),
                                        leading: const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 15),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0xffFF1616),
                                          ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            context
                                                .read<FavouritesCubit>()
                                                .mixpanel
                                                .track(
                                                    "removedFavFromSearchRecomPlace");
                                            context
                                                .read<FavouritesCubit>()
                                                .unFavSavedFromRecommendation(
                                                    recom);
                                            state.fromLocations.remove(recom);
                                            List<SavedFromRecommendation>
                                                updFromLocations =
                                                state.fromLocations;
                                            setState(() {
                                              favSavedFromRecommemdations =
                                                  updFromLocations;
                                            });
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
                  state.pageStatus == FavouritesPlaceStatus.loaded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: favSavedToRecommemdations.map((recom) {
                              String mainAddr;
                              String secondaryAddr;
                              mainAddr = recom.main ?? "";
                              secondaryAddr = recom.secondary ?? "";
                              ValueNotifier<bool> isFavourite =
                                  ValueNotifier(recom.isFavourite ?? true);
                              return ValueListenableBuilder(
                                  valueListenable: isFavourite,
                                  builder: (context, value, _) {
                                    return Card(
                                      child: ListTile(
                                        style: ListTileStyle.list,
                                        onTap: () async {
                                          // Navigator.push<void>(
                                          //   context,
                                          //   MaterialPageRoute<void>(
                                          //     builder: (BuildContext context) =>
                                          //         HomePage(
                                          //       isFromSearch: true,
                                          //       placeId: destinationId,
                                          //       isFromOffline: false,
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        contentPadding: const EdgeInsets.all(5),
                                        leading: const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 15),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0xff004AAD),
                                          ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            context
                                                .read<FavouritesCubit>()
                                                .mixpanel
                                                .track(
                                                    "removedFavDestSearchRecomPlace");
                                            context
                                                .read<FavouritesCubit>()
                                                .unFavSavedToRecommendation(
                                                    recom);
                                            state.toLocations.remove(recom);
                                            List<SavedToRecommendation>
                                                updToLocations =
                                                state.toLocations;
                                            setState(() {
                                              favSavedToRecommemdations =
                                                  updToLocations;
                                            });
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
