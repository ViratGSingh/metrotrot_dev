import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/login/presentation/cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // if (state.status == NearbyMetroStatus.check) {
        //   context.read<NearbyMetroCubit>().checkUserLocation(state.isOffline);
        // }
        // if (state.status == NearbyMetroStatus.locDenied) {
        //   showGeneralDialog(
        //     context: context,
        //     transitionDuration: Duration(milliseconds: 400),
        //     pageBuilder: (
        //       BuildContext context,
        //       Animation<double> animation,
        //       Animation<double> secondaryAnimation,
        //     ) {
        //       return RequestPermission();
        //     },
        //   );
        // }
        // if (state.status == NearbyMetroStatus.locPermDenied) {
        //   //state.copyWith( status:NearbyMetroStatus.loaded, metro: NearbyMetro.initial(),distance: "N/A");
        //   Navigator.push<void>(
        //     context,
        //     MaterialPageRoute<void>(
        //       builder: (BuildContext context) => FromSearchPage(
        //         isOffline: state.isOffline,
        //       ),
        //     ),
        //   );
        // }
        // // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // constraints: BoxConstraints(minWidth: 300, maxWidth: 450),
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/metrotrot_login.gif",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: Image.asset(
                            "assets/images/metrotrot_header_alt.png",
                            fit: BoxFit.cover,
                            height: 55,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "SEMI-OFFLINE METRO NAVIGATOR",
                            style: GoogleFonts.archivoBlack(
                                color: Color(0xffFFBB23),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 52)),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginCubit>().signIn().then((value) {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              );
                            });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  height: 26,
                                  width: 26,
                                ),
                                Text(
                                  "Log in with Google",
                                  style: GoogleFonts.notoSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox.shrink()
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "By clicking Login, you agree with our ",
                                style: GoogleFonts.notoSans(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              TextSpan(
                                  text: "Terms of Service",
                                  style: GoogleFonts.notoSans(
                                      color: Colors.amber, fontSize: 12),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("terms");
                                    }),
                              TextSpan(
                                text: " and ",
                                style: GoogleFonts.notoSans(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: GoogleFonts.notoSans(
                                      color: Colors.amber, fontSize: 12),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("privacy");
                                    }),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
