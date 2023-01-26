import 'package:app/controllers/home.dart';
import 'package:app/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchAppBar extends GetView<HomeController> {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SearchPage());
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
                  Get.to(SearchPage());
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
