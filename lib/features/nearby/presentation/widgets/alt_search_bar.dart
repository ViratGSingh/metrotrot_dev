import 'package:app/features/nearby/presentation/widgets/alt_search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class AltSearchAppBar extends StatelessWidget {
  final String title;
  final Function(String) onChanged;
  final Function() onLocation;
  final bool isOffline;
  const AltSearchAppBar(
      {super.key,
      required this.onChanged,
      required this.onLocation,
      required this.isOffline,
      this.title = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => AltSearchPage(
              onChanged: onChanged,
              isOffline: isOffline,
              locationName: title == "" ? null : title,
            ),
          ),
        );
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
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: Color(0xFFFFBB23),
                    ),
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => AltSearchPage(
                            onChanged: onChanged,
                            isOffline: isOffline,
                            locationName: title == "" ? null : title,
                          ),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => AltSearchPage(
                            onChanged: onChanged,
                            isOffline: isOffline,
                            locationName: title == "" ? null : title,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width / 2 + 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: title != ""
                            ? Text(
                                title,
                                style: GoogleFonts.notoSans(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14),
                              )
                            : Text(
                                "Search Location",
                                style: GoogleFonts.notoSans(
                                    color: Colors.grey.shade400, fontSize: 14),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              CircularButton(
                  size: 42,
                  icon: const Icon(
                    Icons.my_location,
                    color: Color(0xFFFFBB23),
                  ),
                  onPressed: onLocation),
            ],
          ),
        ),
      ),
    );
  }
}
