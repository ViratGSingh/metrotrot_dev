// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/nearby/data/models/recommendation.dart';
import 'package:app/features/nearby/presentation/pages/nearby.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AltSearchPage extends StatefulWidget {
  final bool isOffline;
  final String? locationName;
  final Function(String) onChanged;
  const AltSearchPage(
      {super.key,
      required this.onChanged,
      this.locationName,
      this.isOffline = false});

  @override
  State<AltSearchPage> createState() => _AltSearchPageState();
}

class _AltSearchPageState extends State<AltSearchPage> {
  TextEditingController fromSearchController = TextEditingController();
  @override
  void initState() {
    fromSearchController.text =
        widget.locationName != null ? widget.locationName ?? "" : "";
    super.initState();
  }

  bool isLoading = false;
  List<Recommendation> recommendations = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: TextFormField(
                controller: fromSearchController,
                autofocus: true,
                onChanged: (location) async {
                  setState(() {
                    isLoading = true;
                  });
                  List<Recommendation> newRecommendations =
                      await widget.onChanged(location);
                  print(newRecommendations.length);
                  setState(() {
                    recommendations = newRecommendations;
                    isLoading = false;
                  });
                },
                decoration: InputDecoration(
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                    hintText: "Where are you?",
                    contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 0)),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  "Suggested Places",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              isLoading == false
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: recommendations.map((recom) {
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
                                        NearbyPage(placeId: destinationId),
                                  ),
                                );
                              },
                              contentPadding: const EdgeInsets.all(5),
                              leading: const Padding(
                                padding: EdgeInsets.only(top: 5, left: 15),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFFFFBB23),
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
              // Divider(height: 10),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              //   child: Text(
              //     "Suggested Stations",
              //     style: TextStyle(color: Colors.grey),
              //   ),
              // ),
              // isLoading == false
              //     ? Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ListView(
              //           physics: NeverScrollableScrollPhysics(),
              //           shrinkWrap: true,
              //           children: state.stations.map((recom) {
              //             String mainAddr;
              //             String secondaryAddr;
              //             String destinationId;
              //             mainAddr = recom.main;
              //             secondaryAddr = recom.secondary;
              //             destinationId = recom.placeId;
              //             return Card(
              //               child: ListTile(
              //                 style: ListTileStyle.list,
              //                 onTap: () async {
              //                   Navigator.push<void>(
              //                     context,
              //                     MaterialPageRoute<void>(
              //                       builder: (BuildContext context) => HomePage(
              //                         isFromSearch: true,
              //                         placeId: destinationId,
              //                         isFromOffline: true,
              //                       ),
              //                     ),
              //                   );
              //                 },
              //                 contentPadding: EdgeInsets.all(5),

              //                 leading: const Padding(
              //                   padding: EdgeInsets.only(top: 5, left: 15),
              //                   child: Icon(
              //                     Icons.directions_subway_filled_outlined,
              //                     color: Color(0xffFF1616),
              //                   ),
              //                 ),
              //                 // trailing: Padding(
              //                 //   padding: const EdgeInsets.only(bottom: 10, right: 15),
              //                 //   child: Icon(
              //                 //     Icons.search,
              //                 //     color: Colors.blue,
              //                 //     // color:
              //                 //     //     Color(int.parse("0xff${recom["line_color_code"]}")),
              //                 //   ),
              //                 // ),
              //                 subtitle: Text(
              //                   secondaryAddr,
              //                   style: GoogleFonts.notoSans(
              //                       fontSize: 12, color: Colors.grey.shade700),
              //                 ),
              //                 title: Text(
              //                   mainAddr,
              //                   style: GoogleFonts.notoSans(fontSize: 14),
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //         ),
              //       )
              //     : const Center(
              //         child: CircularProgressIndicator(),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
