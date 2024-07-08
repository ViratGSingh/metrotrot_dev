// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/features/from_search/presentation/cubit/from_search_cubit.dart';
import 'package:app/features/home/presentation/pages/home.dart';

class FromSearchPage extends StatefulWidget {
  final bool isOffline;
  const FromSearchPage({
    Key? key,
    this.isOffline = false,
  }) : super(key: key);

  @override
  State<FromSearchPage> createState() => _FromSearchPageState();
}

class _FromSearchPageState extends State<FromSearchPage> {
  TextEditingController fromSearchController = TextEditingController();
  @override
  void initState() {
    context
        .read<FromSearchCubit>()
        .getSearchRecommendations(fromSearchController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<FromSearchCubit, FromSearchState>(
          listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            title: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: TextFormField(
                  controller: fromSearchController,
                  autofocus: true,
                  onChanged: (location) {
                    context
                        .read<FromSearchCubit>()
                        .getSearchRecommendations(fromSearchController.text);
                  },
                  decoration: InputDecoration(
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: "Where are you?",
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
                state.placeStatus == FromSearchPlaceStatus.loaded
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
                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                HomePage(
                                              isFromSearch: true,
                                              placeId: destinationId,
                                              isFromOffline: false,
                                            ),
                                          ),
                                        );
                                      },
                                      contentPadding: EdgeInsets.all(5),
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
                                              .read<FromSearchCubit>()
                                              .updateSavedFromRecommendation(
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
                                        style:
                                            GoogleFonts.notoSans(fontSize: 14),
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
                state.stationStatus == FromSearchStationStatus.loaded
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
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          HomePage(
                                        isFromSearch: true,
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
                                    color: Color(0xffFF1616),
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
      }),
    );
  }
}
