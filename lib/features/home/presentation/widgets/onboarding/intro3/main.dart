import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro3ScreenBody extends GetView {
  const Intro3ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 2 * MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 3,
        child: Image.asset(
          "assets/images/onboarding_3.gif",
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              width: 2 * MediaQuery.of(context).size.width / 3 + 50,
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: const Text(
                "Memorize Your Route with Ease",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 2 * MediaQuery.of(context).size.width / 3 + 50,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: const Text(
                "Experience a game-changing method to show directions with conciseness and unforgettable clarity",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   width: 2 * MediaQuery.of(context).size.width / 3 + 50,
      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(
      //         Icons.circle,
      //         color: Colors.grey,
      //         size: 8,
      //       ),
      //       SizedBox(
      //         width: 2,
      //       ),
      //       Icon(
      //         Icons.circle,
      //         color: Colors.grey,
      //         size: 8,
      //       ),
      //       SizedBox(
      //         width: 2,
      //       ),
      //       Icon(
      //         Icons.circle,
      //         color: Colors.white,
      //         size: 10,
      //       ),
      //     ],
      //   ),
      // ),
    ]);
  }
}
