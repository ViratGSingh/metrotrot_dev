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
        .getSearchRecommendations(fromSearchController.text, widget.isOffline);
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
                    if (location.isNotEmpty == true) {
                      context.read<FromSearchCubit>().getSearchRecommendations(
                          fromSearchController.text, widget.isOffline);
                    }
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
          body: state.status == FromSearchStatus.loaded
              ? ListView(
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
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => HomePage(
                                isFromSearch: true,
                                placeId: destinationId,
                                isFromOffline: widget.isOffline,
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(0),
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 5, left: 15),
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xffFF1616),
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
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        title: Text(
                          mainAddr,
                          style: GoogleFonts.notoSans(fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
    );
  }
}
