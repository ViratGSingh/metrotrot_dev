// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/dest_history/presentation/pages/dest_history.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/presentation/widgets/privacy_policy.dart';
import 'package:app/features/login/presentation/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webview_flutter/webview_flutter.dart';

class UserProfileDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final FromMetro? fromMetro;
  final bool isGuest;
  final bool isOffline;
  final String userId;
  final String fromDistance;
  const UserProfileDrawer(
      {Key? key,
      this.userId = "",
      this.userName = "Welcome",
      this.userEmail = "Log in to save your routes",
      required this.isGuest,
      required this.fromDistance,
      this.fromMetro,
      required this.isOffline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  children: [
                    //Icon(Icons.account_circle_outlined, size: 40,),SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            child: Text(
                          userEmail,
                          style: GoogleFonts.notoSans(
                              fontSize: 14, color: Colors.grey),
                        ))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black.withOpacity(0.10)),
                    ),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome.gif"),
                    ),
                  ),
                  child: null),
              // ListTile(
              //   title: Row(
              //     children: [
              //       Icon(Icons.favorite_border_outlined, color: Colors.black),
              //       SizedBox(
              //         width: 4,
              //       ),
              //       Text("Liked routes",
              //           style: GoogleFonts.notoSans(
              //               fontSize: 16, fontWeight: FontWeight.w500))
              //     ],
              //   ),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   title:  Row(children: [Icon(Icons.directions_subway_filled_outlined, color: Colors.black),SizedBox(width: 4,), Text("Offline metros",style:GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500) )],),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.history, color: Colors.black),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Location history",
                        style: GoogleFonts.notoSans(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  if (isGuest == false) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => DestHistoryPage(
                          fromDistance: fromDistance,
                          userId: userId,
                          isOffline: isOffline,
                          fromMetro: fromMetro ?? FromMetro.initial(),
                        ),
                      ),
                    );
                  } else {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  }
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined, color: Colors.black),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Privacy policy",
                        style: GoogleFonts.notoSans(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const WebViewExample(),
                    ),
                  );
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 0),
            child: ListTile(
              title: Row(
                children: [
                  Icon(
                      isGuest == true
                          ? Icons.login_outlined
                          : Icons.logout_outlined,
                      color: Colors.black),
                  SizedBox(
                    width: 4,
                  ),
                  Text(isGuest == true ? "Log in" : "Log out",
                      style: GoogleFonts.notoSans(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                if (isGuest == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginPage(),
                    ),
                  );
                } else {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginPage(),
                      ),
                    );
                  });
                }
                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
