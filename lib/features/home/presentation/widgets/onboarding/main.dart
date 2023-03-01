import 'package:app/features/home/presentation/widgets/onboarding/intro1/main.dart';
import 'package:app/features/home/presentation/widgets/onboarding/intro2/main.dart';
import 'package:app/features/home/presentation/widgets/onboarding/intro3/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app/features/home/presentation/widgets/permissions.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // var currentUser = _auth.authStateChanges();
    // currentUser.listen((event) {
    //   if (event == null) {
    //     Get.toNamed("/");
    //   } else {
    //     Get.toNamed("/search");
    //   }
    // });
    super.initState();
  }

  getCarouselIcons(int step, int totalDirections) {
    List<Widget> icons = [];
    for (double i = 0; i < totalDirections; i++) {
      Color defColor = Color(0xff000000);
      int defSize = 10;
      if (i == step) {
        icons.add(
          const Icon(
            Icons.circle,
            size: 14,
            color: Color(0xffFFBB23),
          ),
        );
      } else {
        icons.add(
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xff000000).withOpacity(0.4),
          ),
        );
      }
    }
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> i = ValueNotifier<int>(0);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: GestureDetector(
        //     onTap: () {
        //       //Get.toNamed("/");
        //     },
        //     child: Image.asset(
        //       "assets/images/metrotrot.png",
        //       fit: BoxFit.fill,
        //       height: 50,
        //       width: 50,
        //     ),
        //   ),
        // ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox.shrink(),
              Column(
                children: [
                  CarouselSlider(
                    items: [
                      Intro1ScreenBody(),
                      Intro2ScreenBody(),
                      Intro3ScreenBody()
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 2 + 100,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged:
                          (int page, CarouselPageChangedReason reason) {
                        i.value = page;
                        // slideNum.value = page;
                        // if (page == 2) {
                        //   isDone.value = true;
                        // }
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: i,
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      return Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getCarouselIcons(i.value, 3),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // Container(
              //   width: 2 * MediaQuery.of(context).size.width / 3 + 50,
              //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.circle,
              //         color: Colors.white,
              //         size: 10,
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
              //       )
              //     ],
              //   ),
              // ),
              // ValueListenableBuilder(
              //   valueListenable: i,
              //   builder: (BuildContext context, dynamic value, Widget? child) {
              //     return Padding(
              //       padding: EdgeInsets.only(top: 0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: getCarouselIcons(i.value, 3),
              //       ),
              //     );
              //   },
              // ),

              ValueListenableBuilder(
                  valueListenable: i,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      height: 60,
                      child: i.value == 2
                          ? TextButton(
                              onPressed: () {
                                //Get.toNamed("/profile/pronoun");
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        RequestPermission(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ))
                          : const SizedBox.shrink(),
                    );
                  })
              // : Container(
              //     alignment: Alignment.center,
              //     height: 60,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         //c.twitterSignin();
              //         //Get.offAndToNamed("/connect");
              //         //Get.toNamed("/profile/pronoun");
              //       },
              //       style: ButtonStyle(
              //         backgroundColor:
              //             MaterialStateProperty.all(Colors.white),
              //         fixedSize: MaterialStateProperty.all(
              //           Size(
              //               MediaQuery.of(context).size.width <= 500
              //                   ? MediaQuery.of(context).size.width
              //                   : 300,
              //               50),
              //         ),
              //         shape: MaterialStateProperty.all(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25),
              //           ),
              //         ),
              //       ),
              //       child: const Text(
              //         "Get Started",
              //         style: TextStyle(color: Colors.black, fontSize: 18),
              //       ),
              //     ),
              //   );
            ],
          ),
        ),
      ),
    );
  }
}
