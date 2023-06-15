import 'package:app/features/destination/presentation/widgets/errors/main.dart';
import 'package:app/features/destination/presentation/widgets/warnings/main.dart';
import 'package:app/features/from_search/presentation/pages/from_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/presentation/pages/to_search.dart';

class SearchAppBar extends StatelessWidget {
  final FromMetro fromMetro;
  final String userId;
  final bool isGuest;
  final bool isOffline;
  final double lat;
  final String distance;
  final double lng;
  const SearchAppBar(
      {super.key,
      required this.fromMetro,
      required this.userId,
      required this.isGuest,
      required this.lat,
      required this.distance,
      required this.lng,
      required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(lat!=0 && lat!=0){
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ToSearchPage(
                userId: userId,
                isGuest: isGuest,
                distance: distance,
                fromMetro: fromMetro,
                isOffline: isOffline,
                lat: lat,
                lng: lng),
          ),
        );
        }else{
          showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ErrorPopup(
                                    title: "Error!",
                                    message:
                                        "Please select your departure metro station before searching for your destination.",
                                    action: "Select Station",
                                    actionFunc: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const FromSearchPage(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
          print(fromMetro);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.25),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ToSearchPage(
                        userId: userId,
                        isGuest: isGuest,
                          distance: distance,
                          fromMetro: fromMetro,
                          isOffline: isOffline,
                          lat: lat,
                          lng: lng),
                    ),
                  );
                },
              ),
              Text(
                "Where to?",
                style: GoogleFonts.notoSans(
                    color: Theme.of(context).hintColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
