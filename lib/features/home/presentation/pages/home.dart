import 'package:app/features/home/presentation/widgets/map.dart';
import 'package:app/features/home/presentation/widgets/service_tile.dart';
import 'package:app/features/nearby/presentation/pages/nearby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/from_search/presentation/pages/from_search.dart';
import 'package:app/features/home/presentation/cubit/home_cubit.dart';
import 'package:app/features/home/presentation/widgets/card.dart';
import 'package:app/features/home/presentation/widgets/permissions.dart';
import 'package:app/features/home/presentation/widgets/nearestFrom.dart';
import 'package:app/features/home/presentation/widgets/search_appbar.dart';
import 'package:app/features/home/presentation/widgets/recoms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/directions/presentation/pages/directions.dart';

class HomePage extends StatefulWidget {
  final bool isFromSearch;
  final bool isFromOffline;
  final String placeId;
  const HomePage(
      {super.key,
      this.isFromSearch = false,
      this.isFromOffline = false,
      this.placeId = ""});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImageProvider _imageProvider;
  bool isImageError = false;
  @override
  void initState() {
    if (widget.isFromSearch == false && widget.placeId != "") {
      //context.read<HomeCubit>().checkUserLocation(false);
      context
          .read<HomeCubit>()
          .getDestNearbyMetro(widget.placeId, widget.isFromOffline);
    } else if (widget.isFromSearch == true && widget.placeId != "") {
      context
          .read<HomeCubit>()
          .getFromNearbyMetro(widget.placeId, widget.isFromOffline);
    }
    super.initState();
  }

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.check) {
          context.read<HomeCubit>().checkUserLocation(state.isOffline);
        }
        if (state.status == HomeStatus.locDenied) {
          showGeneralDialog(
            context: context,
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return RequestPermission();
            },
          );
        }
        if (state.status == HomeStatus.locPermDenied) {
          //state.copyWith( status:HomeStatus.loaded, metro: NearbyMetro.initial(),distance: "N/A");
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FromSearchPage(
                isOffline: true,
              ),
            ),
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().callMetroHelpline('tel:155370');
              },
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(5),
                  ),
                  fixedSize: MaterialStatePropertyAll(
                    Size(80, 80),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFFFBB23),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.support_agent, color: Colors.white),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Helpline",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   shadowColor: Colors.transparent,
            //   elevation: 0,
            //   actions: [
            //     Padding(
            //       padding: const EdgeInsets.only(right: 20),
            //       child: InternetStatus(
            //         isOffline: state.isOffline,
            //         tapLogic: () {
            //           if (state.isOffline == false) {
            //             return context
            //                 .read<HomeCubit>()
            //                 .getOfflineFromStation();
            //           } else {
            //             return context
            //                 .read<HomeCubit>()
            //                 .checkUserLocation(
            //                     state.isOffline == false ? true : false);
            //           }
            //         },
            //       ),
            //     ),
            //   ],
            //   leading: Builder(builder: (context) {
            //     return IconButton(
            //       icon: state.user == null
            //           ? const Icon(
            //               Icons.account_circle_rounded,
            //               size: 32,
            //             )
            //           : Container(
            //               height: 32,
            //               width: 32,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(16),
            //                   image: DecorationImage(
            //                       image: isImageError == false
            //                           ? NetworkImage(
            //                               state.user!.photoURL.toString())
            //                           : _imageProvider,
            //                       onError: (exception, stackTrace) {
            //                         //print("Asdasda");
            //                         isImageError = true;
            //                         setState(() {
            //                           _imageProvider = const AssetImage(
            //                               "assets/images/user.png");
            //                         });
            //                       },
            //                       fit: BoxFit.cover),
            //                   boxShadow: [
            //                     BoxShadow(
            //                         blurRadius: 4,
            //                         offset: Offset(0, 4),
            //                         color: Colors.black.withOpacity(0.25))
            //                   ]),
            //             ),
            //       color: Color(0xffFFBB23),
            //       onPressed: () {
            //         // Wiredash.of(context)
            //         //     .show(inheritMaterialTheme: true);
            //         Scaffold.of(context).openDrawer();
            //       },
            //     );
            //   }),
            // ),
            // drawer: state.user != null
            //     ? UserProfileDrawer(
            //         fromDistance: state.distance,
            //         userId: state.user!.uid.toString(),
            //         userName: state.user!.displayName.toString(),
            //         userEmail: state.user!.email.toString(),
            //         isGuest: false,
            //         isOffline: state.isOffline,
            //         fromMetro: state.metro,
            //       )
            //     : UserProfileDrawer(
            //         fromDistance: state.distance,
            //         isGuest: true,
            //         isOffline: state.isOffline),
            body: RefreshIndicator(
              onRefresh: () {
                return context.read<HomeCubit>().checkUserLocation(false);
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //Title
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Dilli",
                                  style: GoogleFonts.pacifico(
                                      color: Color(0xFFFFBB23), fontSize: 36),
                                )
                              ],
                            ),
                          ),

                          //From-To Route
                          SearchAppBar(
                              title: state.fromData.fromName,
                              userId: state.user == null
                                  ? "guest"
                                  : state.user!.uid,
                              isDest: false,
                              isGuest: state.user == null ? true : false,
                              fromMetro: state.fromData,
                              distance: state.distance,
                              isOffline: state.isOffline,
                              lat: state.fromData.lat,
                              lng: state.fromData.lng),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 0),
                                    width:
                                        1, // Width of the container holding the dots
                                    height: 80, // Height of the dotted line
                                    child: CustomPaint(
                                      painter: DashedLinePainter(
                                        dashWidth: 4,
                                        dashSpace: 4,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeCubit>().exchangePoints(
                                          state.fromData, state.toData);
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.zero),
                                      fixedSize: MaterialStatePropertyAll(
                                        Size(52, 52),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFFFFBB23),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        CircleBorder(),
                                      ),
                                    ),
                                    child: Icon(Icons.swap_vert,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SearchAppBar(
                              title: state.toData.destName,
                              userId: state.user == null
                                  ? "guest"
                                  : state.user!.uid,
                              isDest: true,
                              isGuest: state.user == null ? true : false,
                              fromMetro: state.fromData,
                              distance: state.distance,
                              isOffline: state.isOffline,
                              lat: state.fromData.lat,
                              lng: state.fromData.lng),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //Directions Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => DirectionsPage(
                                  fromMetro: state.fromData,
                                  destMetro: state.toData,
                                  destName: state.toData.destName,
                                  destAddress: state.toData.destAddress,
                                  fromDistance: "0",
                                  toDistance: "0",
                                  isOffline: state.isOffline,
                                  destination: state.toData.destName),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(MediaQuery.of(context).size.width, 52),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFFFFBB23),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Directions",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),

                    //Route Section Divider
                    SizedBox(height: 30),
                    Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.10),
                    ),

                    //Services
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Services",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              ServiceTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const MetroMapView(metro: "dmrc"),
                                      ),
                                    );
                                  },
                                  icon: Icons.map_outlined,
                                  title: "Map"),
                              ServiceTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const NearbyPage(),
                                      ),
                                    );
                                  },
                                  icon: Icons.pin_drop,
                                  title: "Nearby"),
                              ServiceTile(
                                  onTap: () {},
                                  icon: Icons.favorite,
                                  title: "Favourites"),
                              ServiceTile(
                                  onTap: () {},
                                  icon: Icons.currency_rupee,
                                  title: "Fare"),
                              ServiceTile(
                                  onTap: () {},
                                  icon: Icons.access_time_filled,
                                  title: "Timings")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedLinePainter({
    this.dashWidth = 5.0,
    this.dashSpace = 5.0,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
