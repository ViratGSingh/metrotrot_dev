import 'package:app/features/home/presentation/widgets/tab.dart';
import 'package:app/features/home/presentation/widgets/userDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/from_search/presentation/pages/from_search.dart';
import 'package:app/features/home/presentation/cubit/nearby_metro_cubit.dart';
import 'package:app/features/home/presentation/widgets/card.dart';
import 'package:app/features/home/presentation/widgets/permissions.dart';
import 'package:app/features/home/presentation/widgets/nearestFrom.dart';
import 'package:app/features/home/presentation/widgets/search_appbar.dart';
import 'package:app/features/home/presentation/widgets/status.dart';
import 'package:app/features/home/presentation/widgets/recoms.dart';

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
    if (widget.isFromSearch == false) {
      context.read<NearbyMetroCubit>().checkUserLocation(false);
    } else {
      context
          .read<NearbyMetroCubit>()
          .getFromNearbyMetro(widget.placeId, widget.isFromOffline);
    }
    super.initState();
  }

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearbyMetroCubit, NearbyMetroState>(
      listener: (context, state) {
        if (state.status == NearbyMetroStatus.check) {
          context.read<NearbyMetroCubit>().checkUserLocation(state.isOffline);
        }
        if (state.status == NearbyMetroStatus.locDenied) {
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
        if (state.status == NearbyMetroStatus.locPermDenied) {
          //state.copyWith( status:NearbyMetroStatus.loaded, metro: NearbyMetro.initial(),distance: "N/A");
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FromSearchPage(
                isOffline: state.isOffline,
              ),
            ),
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InternetStatus(
                    isOffline: state.isOffline,
                    tapLogic: () {
                      if (state.isOffline == false) {
                        return context
                            .read<NearbyMetroCubit>()
                            .getOfflineFromStation();
                      } else {
                        return context
                            .read<NearbyMetroCubit>()
                            .checkUserLocation(
                                state.isOffline == false ? true : false);
                      }
                    },
                  ),
                ),
              ],
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: state.user == null
                      ? const Icon(
                          Icons.account_circle_rounded,
                          size: 32,
                        )
                      : Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: isImageError == false
                                      ? NetworkImage(
                                          state.user!.photoURL.toString())
                                      : _imageProvider,
                                  onError: (exception, stackTrace) {
                                    //print("Asdasda");
                                    isImageError = true;
                                    setState(() {
                                      _imageProvider = const AssetImage(
                                          "assets/images/user.png");
                                    });
                                  },
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                        ),
                  color: Color(0xffFFBB23),
                  onPressed: () {
                    // Wiredash.of(context)
                    //     .show(inheritMaterialTheme: true);
                    Scaffold.of(context).openDrawer();
                  },
                );
              }),
            ),
            drawer: state.user != null
                ? UserProfileDrawer(
                    fromDistance: state.distance,
                    userId: state.user!.uid.toString(),
                    userName: state.user!.displayName.toString(),
                    userEmail: state.user!.email.toString(),
                    isGuest: false,
                    isOffline: state.isOffline,
                    fromMetro: state.metro,
                  )
                : UserProfileDrawer(
                    fromDistance: state.distance,
                    isGuest: true,
                    isOffline: state.isOffline),
            body: RefreshIndicator(
              onRefresh: () {
                return context
                    .read<NearbyMetroCubit>()
                    .checkUserLocation(state.isOffline);
              },
              child: Container(
                color: Colors.white,
                // constraints: BoxConstraints(minWidth: 300, maxWidth: 450),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     // Obx(() {
                      //     //   return controller.isOnline.value == true
                      //     //       ? OnlineStatus()
                      //     //       : OfflineStatus();
                      //     // }),
                      //     InternetStatus(
                      //       isOffline: state.isOffline,
                      //       tapLogic: () {
                      //         if (state.isOffline == false) {
                      //           return context
                      //               .read<NearbyMetroCubit>()
                      //               .getOfflineFromStation();
                      //         } else {
                      //           return context
                      //               .read<NearbyMetroCubit>()
                      //               .checkUserLocation(state.isOffline == false
                      //                   ? true
                      //                   : false);
                      //         }
                      //       },
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(right: 10),
                      //       child: IconButton(
                      //         icon: Icon(Icons.feedback),
                      //         color: Color(0xffFFBB23),
                      //         onPressed: () {
                      //           // Wiredash.of(context)
                      //           //     .show(inheritMaterialTheme: true);
                      //           Scaffold.of(context).openDrawer();
                      //         },
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/metrotrot_header.png",
                          fit: BoxFit.cover,
                          width: 250,
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: SearchAppBar(
                            userId:
                                state.user == null ? "guest" : state.user!.uid,
                            isGuest: state.user == null ? true : false,
                            fromMetro: state.metro,
                            distance: state.distance,
                            isOffline: state.isOffline,
                            lat: state.metro.lat,
                            lng: state.metro.lng),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: FromStation(
                            isOffline: state.isOffline,
                            isUpdating: state.status ==
                                        NearbyMetroStatus.loading ||
                                    state.status == NearbyMetroStatus.initial
                                ? true
                                : false,
                            name: state.metro.name,
                            address: state.metro.vicinity),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InfoTab(
                                info: "Info",
                                value: 1,
                                selectedValue: state.selectedValue,
                                selectedFunc: (){
                                  
                                  context
                                    .read<NearbyMetroCubit>()
                                    .changeTab(1, state.isOffline, context);

                                    },
                              ),
                              InfoTab(
                                info: "Recent",
                                value: 2,
                                selectedValue: state.selectedValue,
                                selectedFunc: (){
                                  
                                  context
                                    .read<NearbyMetroCubit>()
                                    .changeTab(2, state.isOffline, context);
                                    },
                              ),
                              InfoTab(
                                info: "Liked",
                                value: 3,
                                selectedValue: state.selectedValue,
                                selectedFunc: (){context
                                    .read<NearbyMetroCubit>()
                                    .changeTab(3, state.isOffline, context);
                                    },
                              ),
                              InfoTab(
                                info: "Suggestions",
                                value: 4,
                                selectedValue: state.selectedValue,
                                selectedFunc: (){context
                                    .read<NearbyMetroCubit>()
                                    .changeTab(4, state.isOffline, context);
                                    },
                              ),
                            ],
                          )),
                          Container(
                            height: MediaQuery.of(context).size.height/2,
                            child: state.selectedValue==1?SingleChildScrollView(
                              child: 
                              Column(children: [
                                Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumberInfoCard(
                                  title: "Distance",
                                  type: "nearest",
                                  info: state.distance,
                                  measure: state.distance != "N/A" ? "metres" : "",
                                  isLoading: state.status ==
                                              NearbyMetroStatus.loading ||
                                          state.status == NearbyMetroStatus.initial
                                      ? true
                                      : false,
                                ),
                                InfoCard(
                                  title: "Operational",
                                  type: "operational_from",
                                  info: state.metro.businessStatus,
                                  isLoading: state.status ==
                                              NearbyMetroStatus.loading ||
                                          state.status == NearbyMetroStatus.initial
                                      ? true
                                      : false,
                                )
                              ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                                                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoCard(
                                  title: "Rating",
                                  type: "rating",
                                  info: state.metro.rating.toString(),
                                  isLoading: state.status ==
                                              NearbyMetroStatus.loading ||
                                          state.status == NearbyMetroStatus.initial
                                      ? true
                                      : false,
                                ),
                                InfoCard(
                                  title: "Users",
                                  type: "reviews",
                                  info: state.metro.userRatingsTotal.toString(),
                                  isLoading: state.status ==
                                              NearbyMetroStatus.loading ||
                                          state.status == NearbyMetroStatus.initial
                                      ? true
                                      : false,
                                )
                              ],
                                                    ),
                                                  )
                              ]),
                            ): DestRecoms(
                              recoms: state.destData!.toList(), 
                            isOffline: state.isOffline,
                            fromDistance: state.distance,
                            isLoading: state.status==NearbyMetroStatus.suggestLoading?true:false,
                            fromMetro: state.metro,
                            fromLat: state.metro.lat ,
                            fromLng: state.metro.lng,
                            tabName: state.selectedValue==2?"Recent":state.selectedValue==3?"Liked":"Suggestions",
                            )
                          )
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
