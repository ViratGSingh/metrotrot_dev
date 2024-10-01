// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:app/models/location.dart';
import 'package:app/widgets/popups/premium.dart';
import 'package:app/widgets/popups/warning.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:isar/isar.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/home/data/repositories/home_repository.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeState.initial());

  //Change Tab
  // changeTab(int tabValue, bool isOffline, BuildContext context) async {
  //   int newSelectedValue = state.selectedValue;
  //   List<DestTapData> destData = [];
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     if (tabValue == 1) {
  //       newSelectedValue = tabValue;
  //     } else {
  //       newSelectedValue = state.selectedValue;
  //       //Login Popup
  //       String tabName = "";
  //       if (tabValue == 2) {
  //         tabName = "recent";
  //       } else if (tabValue == 3) {
  //         tabName = "liked";
  //       } else if (tabValue == 4) {
  //         tabName = "suggested";
  //       }
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return ErrorPopup(
  //             title: "Error!",
  //             message:
  //                 "You aren't logged in right now, please make sure you are logged in to see your $tabName routes.",
  //             action: "To Login",
  //             actionFunc: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute<void>(
  //                   builder: (BuildContext context) => const LoginPage(),
  //                 ),
  //               );
  //             },
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     newSelectedValue = tabValue;
  //   }
  //   emit(
  //     state.copyWith(
  //         status: HomeStatus.suggestLoading,
  //         selectedValue: newSelectedValue,
  //         destData: destData,
  //         isOffline: isOffline),
  //   );

  //   if (user != null) {
  //     newSelectedValue = tabValue;
  //     //Recent Data
  //     print(newSelectedValue);
  //     if (newSelectedValue == 2) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .orderBy("last_tapped_at", descending: true)
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     } else if (newSelectedValue == 3) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .where("is_liked", isEqualTo: true)
  //           .orderBy("last_tapped_at")
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     } else if (newSelectedValue == 4) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .orderBy("total_taps", descending: true)
  //           .orderBy("last_tapped_at")
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     }
  //     print(destData);
  //   }
  //   print(newSelectedValue);
  //   emit(
  //     state.copyWith(
  //         status: HomeStatus.loaded,
  //         selectedValue: newSelectedValue,
  //         destData: destData,
  //         isOffline: isOffline),
  //   );
  // }
  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(mixpanelProjectId,
        trackAutomaticEvents: false);
    mixpanel.track("openedHomePage");
  }

  Future<void> navigateToListing() async {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing();
  }
  String mixpanelProjectId = "";
  String revenuecatApiKey = "";
  Future<void> loadEnv() async{
    await dotenv.load(fileName: '.env');
    mixpanelProjectId = dotenv.env["MIXPANEL_PROJECT_ID"].toString();
    revenuecatApiKey = dotenv.env["REVENUECAT_API_KEY"].toString();
  }



// Future<void> initPlatformState() async {
//   await Purchases.setDebugLogsEnabled(true);
//   PurchasesConfiguration configuration;
//   configuration = PurchasesConfiguration(revenuecatApiKey);
//   await Purchases.configure(configuration);
// }

Future<void> showPremiumPackage() async {
 try {
  Offerings offerings = await Purchases.getOfferings();
  if (offerings.getOffering("Premium Access")?.availablePackages!=null) {
    // Display packages for sale
    Offering? premiumOffering = offerings.getOffering("Premium Access");
    await RevenueCatUI.presentPaywall(offering:premiumOffering);
  }
} on PlatformException {
	// optional error handling
}
}

  saveDestinationInfo(
      String userId,
      bool isGuest,
      FromMetro fromMetro,
      String toPlaceId,
      String toMain,
      String toSecondary,
      double userLat,
      double userLng) async {
    DestTapData destData = DestTapData(
        userId: userId,
        isGuest: isGuest,
        fromMetroBusinessStatus: fromMetro.businessStatus,
        fromMetroLat: fromMetro.lat,
        fromMetroLng: fromMetro.lng,
        fromMetroName: fromMetro.name,
        fromMetroPlaceId: fromMetro.placeId,
        fromMetroRating: fromMetro.rating,
        fromMetroRatedUsers: fromMetro.userRatingsTotal,
        fromMetroAddress: fromMetro.vicinity,
        userLat: userLat,
        userLng: userLng,
        toPlaceId: toPlaceId,
        toName: toMain,
        toAddress: toSecondary,
        totalTaps: 1,
        firstTappedAt: DateTime.now(),
        lastTappedAt: DateTime.now());
    FirebaseFirestore db = FirebaseFirestore.instance;
    String destSearchId = "${userId}_${fromMetro.placeId}_$toPlaceId";
    db.collection("dest_history").doc(destSearchId).get().then((value) {
      if (value.exists) {
        //Update User Info
        Map<String, dynamic>? oldData = value.data();
        if (oldData != null) {
          DestTapData oldDestData = DestTapData.fromMap(oldData);
          destData.totalTaps = oldDestData.totalTaps + 1;
          destData.firstTappedAt = oldDestData.firstTappedAt;
          destData.isLiked = oldDestData.isLiked;
        }
        destData.lastTappedAt = DateTime.now();
        db
            .collection("dest_history")
            .doc(destSearchId)
            .update(destData.toMap())
            .onError((e, _) => print("Error writing document: $e"));
      } else {
        //Set First Time Info
        db
            .collection("dest_history")
            .doc(destSearchId)
            .set(destData.toMap())
            .onError((e, _) => print("Error writing document: $e"));
      }
    });
  }

  checkUserLocation(isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: HomeStatus.loading, isOffline: isOffline));
    var status = await Permission.location.request();

    if (status.isPermanentlyDenied) {
      emit(state.copyWith(
          user: user, status: HomeStatus.locPermDenied, isOffline: isOffline));
    }
    if (status.isDenied) {
      emit(state.copyWith(
          user: user, status: HomeStatus.locDenied, isOffline: isOffline));
    }

    if (status.isGranted || status.isLimited) {
      await getNearbyMetro();
    }
  }

  Future getNearbyMetro() async {
    User? user = FirebaseAuth.instance.currentUser;
    var locAccuracy = await Geolocator.getLocationAccuracy();
    Position accPos;
    if (locAccuracy == LocationAccuracyStatus.precise) {
      accPos = await Geolocator.getCurrentPosition();
    } else {
      accPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    }
    emit(state.copyWith(
        user: user, status: HomeStatus.loading, isOffline: false));
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    int metroLines = metroData["total_lines"];
    //print(metroLines);
    final userLocation =
        Location(accPos.latitude, accPos.longitude); // User's location
    List<Map<String, dynamic>> metroStations = [];
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      for (var element in lineData) {
        Map<String, dynamic> stationData = element;
        metroStations.add(stationData);
      }
      //metroStations.addAll(lineData);
    }
    final coordinatesToCheck = metroStations;

    final closestLocation =
        findClosestStation(coordinatesToCheck, userLocation);
    //print(
    //    'Closest location is: (${closestLocation["name"]}, ${closestLocation["address"]})');
    List lineKeys = closestLocation["interchange_data"]["lines"];
    List<String> lines = [];
    List<String> startStations = [];
    List<String> endStations = [];
    List<String> colourCodes = [];
    for (var element in lineKeys) {
      Map<String, dynamic> lineData = metroData["data"][element];
      lines.add(lineData["name"]);
      startStations.add(lineData["stations"][0]["name"]);
      endStations.add(lineData["stations"].last["name"]);
      colourCodes.add(lineData["colour_code"]);
    }
    // final FromMetro nearbyMetro = await homeRepository.fetchNearestMetro(
    //     accPos.latitude, accPos.longitude);
    // var distance = Geolocator.distanceBetween(
    //     nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);
    final FromMetro nearbyMetro = FromMetro(
        fromName: "",
        fromAddress: "",
        businessStatus:
            closestLocation["is_interchange"] == true ? "Yes" : "No",
        fromLat: closestLocation["coordinates"]["lat"],
        fromLng: closestLocation["coordinates"]["lng"],
        lat: closestLocation["coordinates"]["lat"],
        lng: closestLocation["coordinates"]["lng"],
        name: closestLocation["name"],
        placeId: closestLocation["place_id"],
        rating: "",
        userRatingsTotal: "",
        vicinity: closestLocation["address"],
        data: "",
        metro: metroData["name"],
        lines: lines,
        colourCodes: colourCodes,
        startStations: startStations,
        endStations: endStations);

    emit(
      state.copyWith(
        status: HomeStatus.loaded,
        user: user,
        fromData: nearbyMetro,
        isOffline: false,
        distance: (closestLocation["distance"] * 1000).toStringAsFixed(0),
      ),
    );
  }

  Future getFromNearbyMetro(String placeId, bool isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: HomeStatus.loading, isOffline: isOffline));
    //FromMetro nearbyMetro = FromMetro.initial();
    String distance = "N/A";
    FromMetro nearbyMetro = FromMetro.initial();

    String fromName = "";
    String fromAddress = "";

  final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
        ],
        directory: dir.path
        );
    if (isOffline == false) {
      //Check in saved source locations
      final savedFromMetro = await isar.savedFromMetros
          .filter()
          .placeIdEqualTo(placeId)
          .findFirst();

      final savedDestMetro = await isar.savedDestMetros
          .filter()
          .placeIdEqualTo(placeId)
          .findFirst();
      
      if (savedFromMetro != null) {
        nearbyMetro = FromMetro(
            businessStatus: savedFromMetro.businessStatus ?? "",
            fromLat: savedFromMetro.fromLat ?? 0,
            fromLng: savedFromMetro.fromLng ?? 0,
            lat: savedFromMetro.lat ?? 0,
            lng: savedFromMetro.lng ?? 0,
            name: savedFromMetro.name ?? "",
            fromName: savedFromMetro.fromName ?? "",
            fromAddress: savedFromMetro.fromAddress ?? "",
            placeId: savedFromMetro.placeId ?? "",
            rating: savedFromMetro.rating ?? "",
            userRatingsTotal: savedFromMetro.userRatingsTotal ?? "",
            vicinity: savedFromMetro.vicinity ?? "",
            data: savedFromMetro.data ?? "",
            metro: savedFromMetro.metro ?? "",
            lines: savedFromMetro.lines ?? [],
            startStations: savedFromMetro.startStations ?? [],
            endStations: savedFromMetro.endStations ?? [],
            colourCodes: savedFromMetro.colourCodes ?? []);

        distance = Geolocator.distanceBetween(
          nearbyMetro.fromLat,
          nearbyMetro.fromLng,
          nearbyMetro.lat,
          nearbyMetro.lng,
        ).toStringAsFixed(0);
      }else if(savedDestMetro!=null){

        nearbyMetro = FromMetro(
            businessStatus: savedDestMetro.businessStatus ?? "",
            fromLat: savedDestMetro.destLat ?? 0,
            fromLng: savedDestMetro.destLng ?? 0,
            lat: savedDestMetro.nearbyMetroLat ?? 0,
            lng: savedDestMetro.nearbyMetroLng ?? 0,
            name: savedDestMetro.name ?? "",
            fromName: savedDestMetro.destName ?? "",
            fromAddress: savedDestMetro.destAddress ?? "",
            placeId: savedDestMetro.placeId ?? "",
            rating: savedDestMetro.rating ?? "",
            userRatingsTotal: savedDestMetro.userRatingsTotal ?? "",
            vicinity: savedDestMetro.vicinity ?? "",
            data: savedDestMetro.data ?? "",
            metro: savedDestMetro.metro ?? "",
            lines: savedDestMetro.lines ?? [],
            startStations: savedDestMetro.startStations ?? [],
            endStations: savedDestMetro.endStations ?? [],
            colourCodes: savedDestMetro.colourCodes ?? []);
        

        distance = Geolocator.distanceBetween(
          nearbyMetro.fromLat,
          nearbyMetro.fromLng,
          nearbyMetro.lat,
          nearbyMetro.lng,
        ).toStringAsFixed(0);

      }else {
        //Get info if not saved
        Map<String, dynamic> placeInfo =
            await homeRepository.fetchFromNearestMetro(placeId);
        print(placeInfo);
        double fromLat = placeInfo["geometry"]["location"]["lat"];
        double fromLng = placeInfo["geometry"]["location"]["lng"];
        fromName = placeInfo["name"];
        fromAddress = placeInfo["formatted_address"];
        final metroResp =
            await rootBundle.loadString('assets/data/delhi_ncr.json');
        final metroData = json.decode(metroResp);
        int metroLines = metroData["total_lines"];
        //print(metroLines);
        final userLocation = Location(fromLat, fromLng); // User's location
        List<Map<String, dynamic>> metroStations = [];
        for (var i = 1; i <= metroLines; i++) {
          List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
          for (var element in lineData) {
            Map<String, dynamic> stationData = element;
            metroStations.add(stationData);
          }
          //metroStations.addAll(lineData);
        }
        final coordinatesToCheck = metroStations;

        final closestLocation =
            findClosestStation(coordinatesToCheck, userLocation);
        //print(
        //    'Closest location is: (${closestLocation["name"]}, ${closestLocation["address"]})');
        List lineKeys = closestLocation["interchange_data"]["lines"];
        List<String> lines = [];
        List<String> startStations = [];
        List<String> endStations = [];
        List<String> colourCodes = [];
        for (var element in lineKeys) {
          Map<String, dynamic> lineData = metroData["data"][element];
          lines.add(lineData["name"]);
          startStations.add(lineData["stations"][0]["name"]);
          endStations.add(lineData["stations"].last["name"]);
          colourCodes.add(lineData["colour_code"]);
        }
        // final FromMetro nearbyMetro = await homeRepository.fetchNearestMetro(
        //     accPos.latitude, accPos.longitude);
        nearbyMetro = FromMetro(
            fromName: fromName,
            fromAddress: fromAddress,
            businessStatus:
                closestLocation["is_interchange"] == true ? "Yes" : "No",
            fromLat: fromLat,
            fromLng: fromLng,
            lat: closestLocation["coordinates"]["lat"],
            lng: closestLocation["coordinates"]["lng"],
            name: closestLocation["name"],
            placeId: closestLocation["place_id"],
            rating: "",
            userRatingsTotal: "",
            vicinity: closestLocation["address"],
            data: "",
            metro: metroData["name"],
            lines: lines,
            colourCodes: colourCodes,
            startStations: startStations,
            endStations: endStations);
        distance = Geolocator.distanceBetween(
          nearbyMetro.fromLat,
          nearbyMetro.fromLng,
          nearbyMetro.lat,
          nearbyMetro.lng,
        ).toStringAsFixed(0);

        //Save the source location info
        SavedFromMetro formattedFromMetro = SavedFromMetro()
          ..fromName = fromName
          ..fromAddress = fromAddress
          ..businessStatus =
              closestLocation["is_interchange"] == true ? "Yes" : "No"
          ..fromLat = fromLat
          ..fromLng = fromLng
          ..lat = closestLocation["coordinates"]["lat"]
          ..lng = closestLocation["coordinates"]["lng"]
          ..name = closestLocation["name"]
          ..placeId = placeId
          ..rating = ""
          ..userRatingsTotal = ""
          ..vicinity = closestLocation["address"]
          ..data = ""
          ..metro = metroData["name"]
          ..lines = lines
          ..colourCodes = colourCodes
          ..startStations = startStations
          ..endStations = endStations
          ..fromContent = fromName;
        await isar.writeTxn(() async {
          await isar.savedFromMetros.put(formattedFromMetro);
        });
      }
    } else {
      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      Map<String, dynamic> metroStation = {};
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        for (var element in lineData) {
          Map<String, dynamic> stationData = element;
          if (stationData["place_id"] == placeId) {
            metroStation = stationData;
          }
        }
        //metroStations.addAll(lineData);
      }

      List lineKeys = metroStation["interchange_data"]["lines"];
      List<String> lines = [];
      List<String> startStations = [];
      List<String> endStations = [];
      List<String> colourCodes = [];
      for (var element in lineKeys) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      }
      fromName = metroStation["name"];
      fromAddress = metroStation["address"];
      nearbyMetro = FromMetro(
          fromName: fromName,
          fromAddress: fromAddress,
          businessStatus:
              "Yes", //metroStation["is_interchange"] == true ? "Yes" : "No",
          fromLat: metroStation["coordinates"]["lat"],
          fromLng: metroStation["coordinates"]["lng"],
          lat: metroStation["coordinates"]["lat"],
          lng: metroStation["coordinates"]["lng"],
          name: metroStation["name"],
          placeId: metroStation["place_id"],
          rating: "",
          userRatingsTotal: "",
          vicinity: metroStation["address"],
          data: "",
          metro: metroData["name"],
          lines: lines,
          colourCodes: colourCodes,
          startStations: startStations,
          endStations: endStations);

      distance = "0";
      print(nearbyMetro.fromName);
    }

    // if (isOffline == true) {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? fromSearchRecoms = await isar.directions
    //       .filter()
    //       .timeLessThan(DateTime.now())
    //       .fromIdEqualTo(placeId)
    //       .sortByTimeDesc()
    //       .distinctByFromId()
    //       .findFirst();
    //   nearbyMetro = FromMetro.fromJson(fromSearchRecoms!.fromData.toString());
    // } else {
    //   var status = await Permission.location.request();

    //   nearbyMetro = await homeRepository.fetchFromNearestMetro(placeId);

    //   if (status.isGranted == true) {
    //     var locAccuracy = await Geolocator.getLocationAccuracy();
    //     Position accPos;
    //     if (locAccuracy == LocationAccuracyStatus.precise) {
    //       accPos = await Geolocator.getCurrentPosition();
    //     } else {
    //       accPos = await Geolocator.getCurrentPosition(
    //           desiredAccuracy: LocationAccuracy.low);
    //     }
    //     distance = Geolocator.distanceBetween(nearbyMetro.lat, nearbyMetro.lng,
    //             accPos.latitude, accPos.longitude)
    //         .toStringAsFixed(0);
    //   }
    // }
    emit(
      state.copyWith(
        user: user,
        status: HomeStatus.loaded,
        fromData: nearbyMetro,
        isOffline: isOffline,
        distance: distance,
      ),
    );
  }

  // Method to check for update
  void checkForUpdate() async {
    // Check for update
    var updateAvailableResult = await InAppUpdate.checkForUpdate();
    if (updateAvailableResult.updateAvailability ==
        UpdateAvailability.updateAvailable) {
      // If an update is available, initiate the update process
      InAppUpdate.performImmediateUpdate();
    }
  }

  void showLocationErrorInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WarningPopup(
            title: "Error!",
            popupColor: Colors.red,
            popupIcon: Icons.warning,
            message:
                "Source and Destination metro station is the same, change either of them to get its metro route.",
            action: "Back",
            actionFunc: () async {
              Navigator.pop(context);
              //launchUrl(Uri.parse("https://www.threads.net/@viratgsingh"));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => const HomePa,
              //   ),
              // );
            },
          );
        });
  }

  void showPremium(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PremiumPopup(
            title: "Premium",
            popupColor: const Color(0xFFFFBB23),
            message:
                "Source and Destination metro station is the same, change either of them to get its metro route.",
            action: "Continue",
            actionFunc: () async {
              Navigator.pop(context);
              //launchUrl(Uri.parse("https://www.threads.net/@viratgsingh"));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => const HomePa,
              //   ),
              // );
            },
          );
        });
  }

  void exchangePoints(FromMetro source, DestMetro destination) {
    DestMetro newDestination = DestMetro(
        businessStatus: source.businessStatus,
        destLat: source.fromLat,
        destLng: source.fromLng,
        destName: source.fromName,
        destAddress: source.fromAddress,
        nearbyMetroLat: source.lat,
        nearbyMetroLng: source.lng,
        name: source.name,
        placeId: source.placeId,
        rating: source.rating,
        userRatingsTotal: source.userRatingsTotal,
        vicinity: source.vicinity,
        data: source.data,
        metro: source.metro,
        lines: source.lines,
        startStations: source.startStations,
        endStations: source.endStations,
        colourCodes: source.colourCodes);
    FromMetro newSource = FromMetro(
        businessStatus: destination.businessStatus,
        fromLat: destination.destLat,
        fromLng: destination.destLng,
        fromName: destination.destName,
        fromAddress: destination.destAddress,
        lat: destination.nearbyMetroLat,
        lng: destination.nearbyMetroLng,
        name: destination.name,
        placeId: destination.placeId,
        rating: destination.rating,
        userRatingsTotal: destination.userRatingsTotal,
        vicinity: destination.vicinity,
        data: destination.data,
        metro: destination.metro,
        lines: destination.lines,
        startStations: destination.startStations,
        endStations: destination.endStations,
        colourCodes: destination.colourCodes);
    print(newSource);
    print(newDestination);

    emit(state.copyWith(fromData: newSource, toData: newDestination));
  }

  Future<void> callMetroHelpline(String url) async {
    await launch(url);
  }

  Future getDestNearbyMetro(String placeId, bool isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: HomeStatus.loading, isOffline: isOffline));
    //FromMetro nearbyMetro = FromMetro.initial();
    String distance = "N/A";
    DestMetro nearbyMetro = DestMetro.initial();
    String destName = "";
    String destAddress = "";

  final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ],
        directory: dir.path
        );
    if (isOffline == false) {
      //Check in saved source locations
      final savedFromMetro = await isar.savedFromMetros
          .filter()
          .placeIdEqualTo(placeId)
          .findFirst();
      final savedDestMetro = await isar.savedDestMetros
          .filter()
          .placeIdEqualTo(placeId)
          .findFirst();
      if (savedDestMetro != null) {
        nearbyMetro = DestMetro(
            businessStatus: savedDestMetro.businessStatus ?? "",
            destLat: savedDestMetro.destLat ?? 0,
            destLng: savedDestMetro.destLng ?? 0,
            nearbyMetroLat: savedDestMetro.nearbyMetroLat ?? 0,
            nearbyMetroLng: savedDestMetro.nearbyMetroLng ?? 0,
            name: savedDestMetro.name ?? "",
            destName: savedDestMetro.destName ?? "",
            destAddress: savedDestMetro.destAddress ?? "",
            placeId: savedDestMetro.placeId ?? "",
            rating: savedDestMetro.rating ?? "",
            userRatingsTotal: savedDestMetro.userRatingsTotal ?? "",
            vicinity: savedDestMetro.vicinity ?? "",
            data: savedDestMetro.data ?? "",
            metro: savedDestMetro.metro ?? "",
            lines: savedDestMetro.lines ?? [],
            startStations: savedDestMetro.startStations ?? [],
            endStations: savedDestMetro.endStations ?? [],
            colourCodes: savedDestMetro.colourCodes ?? []);

        distance = Geolocator.distanceBetween(
                nearbyMetro.nearbyMetroLat,
                nearbyMetro.nearbyMetroLng,
                nearbyMetro.destLat,
                nearbyMetro.destLng)
            .toStringAsFixed(0);
      } else if(savedFromMetro!=null){
         nearbyMetro = DestMetro(
            businessStatus: savedFromMetro.businessStatus ?? "",
            destLat: savedFromMetro.fromLat ?? 0,
            destLng: savedFromMetro.fromLng ?? 0,
            nearbyMetroLat: savedFromMetro.lat ?? 0,
            nearbyMetroLng: savedFromMetro.lng ?? 0,
            name: savedFromMetro.name ?? "",
            destName: savedFromMetro.fromName ?? "",
            destAddress: savedFromMetro.fromAddress ?? "",
            placeId: savedFromMetro.placeId ?? "",
            rating: savedFromMetro.rating ?? "",
            userRatingsTotal: savedFromMetro.userRatingsTotal ?? "",
            vicinity: savedFromMetro.vicinity ?? "",
            data: savedFromMetro.data ?? "",
            metro: savedFromMetro.metro ?? "",
            lines: savedFromMetro.lines ?? [],
            startStations: savedFromMetro.startStations ?? [],
            endStations: savedFromMetro.endStations ?? [],
            colourCodes: savedFromMetro.colourCodes ?? []);

        distance = Geolocator.distanceBetween(
                nearbyMetro.nearbyMetroLat,
                nearbyMetro.nearbyMetroLng,
                nearbyMetro.destLat,
                nearbyMetro.destLng)
            .toStringAsFixed(0);
      }else {
        Map<String, dynamic> placeInfo =
            await homeRepository.fetchFromNearestMetro(placeId);
        print(placeInfo);
        double lat = placeInfo["geometry"]["location"]["lat"];
        double lng = placeInfo["geometry"]["location"]["lng"];
        destName = placeInfo["name"];
        destAddress = placeInfo["formatted_address"];

        final metroResp =
            await rootBundle.loadString('assets/data/delhi_ncr.json');
        final metroData = json.decode(metroResp);
        int metroLines = metroData["total_lines"];
        //print(metroLines);
        final userLocation = Location(lat, lng); // User's location
        List<Map<String, dynamic>> metroStations = [];
        for (var i = 1; i <= metroLines; i++) {
          List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
          for (var element in lineData) {
            Map<String, dynamic> stationData = element;
            metroStations.add(stationData);
          }
          //metroStations.addAll(lineData);
        }
        final coordinatesToCheck = metroStations;

        final closestLocation =
            findClosestStation(coordinatesToCheck, userLocation);
        //print(
        //    'Closest location is: (${closestLocation["name"]}, ${closestLocation["address"]})');
        List lineKeys = closestLocation["interchange_data"]["lines"];
        List<String> lines = [];
        List<String> startStations = [];
        List<String> endStations = [];
        List<String> colourCodes = [];
        for (var element in lineKeys) {
          Map<String, dynamic> lineData = metroData["data"][element];
          lines.add(lineData["name"]);
          startStations.add(lineData["stations"][0]["name"]);
          endStations.add(lineData["stations"].last["name"]);
          colourCodes.add(lineData["colour_code"]);
        }
        // final FromMetro nearbyMetro = await homeRepository.fetchNearestMetro(
        //     accPos.latitude, accPos.longitude);
        nearbyMetro = DestMetro(
            destName: destName,
            destAddress: destAddress,
            businessStatus:
                closestLocation["is_interchange"] == true ? "Yes" : "No",
            nearbyMetroLat: closestLocation["coordinates"]["lat"],
            nearbyMetroLng: closestLocation["coordinates"]["lng"],
            destLat: lat,
            destLng: lng,
            name: closestLocation["name"],
            placeId: closestLocation["place_id"],
            rating: "",
            userRatingsTotal: "",
            vicinity: closestLocation["address"],
            data: "",
            metro: metroData["name"],
            lines: lines,
            colourCodes: colourCodes,
            startStations: startStations,
            endStations: endStations);
        distance = Geolocator.distanceBetween(nearbyMetro.nearbyMetroLat,
                nearbyMetro.nearbyMetroLng, lat, lng)
            .toStringAsFixed(0);

        //Save the destination location info
        SavedDestMetro formattedDestMetro = SavedDestMetro()
          ..destName = destName
          ..destAddress = destAddress
          ..businessStatus =
              closestLocation["is_interchange"] == true ? "Yes" : "No"
          ..destLat = lat
          ..destLng = lng
          ..nearbyMetroLat = closestLocation["coordinates"]["lat"]
          ..nearbyMetroLng = closestLocation["coordinates"]["lng"]
          ..name = closestLocation["name"]
          ..placeId = placeId
          ..rating = ""
          ..userRatingsTotal = ""
          ..vicinity = closestLocation["address"]
          ..data = ""
          ..metro = metroData["name"]
          ..lines = lines
          ..colourCodes = colourCodes
          ..startStations = startStations
          ..endStations = endStations
          ..destContent = destName;
        await isar.writeTxn(() async {
          await isar.savedDestMetros.put(formattedDestMetro);
        });
      }
    } else {
      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      Map<String, dynamic> metroStation = {};
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        for (var element in lineData) {
          Map<String, dynamic> stationData = element;
          if (stationData["place_id"] == placeId) {
            metroStation = stationData;
          }
        }
        //metroStations.addAll(lineData);
      }

      List lineKeys = metroStation["interchange_data"]["lines"];
      List<String> lines = [];
      List<String> startStations = [];
      List<String> endStations = [];
      List<String> colourCodes = [];
      for (var element in lineKeys) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      }

      destName = metroStation["name"];
      destAddress = metroStation["address"];
      nearbyMetro = DestMetro(
          destName: destName,
          destAddress: destAddress,
          businessStatus: metroStation["is_interchange"] == true ? "Yes" : "No",
          nearbyMetroLat: metroStation["coordinates"]["lat"],
          nearbyMetroLng: metroStation["coordinates"]["lng"],
          destLat: metroStation["coordinates"]["lat"],
          destLng: metroStation["coordinates"]["lng"],
          name: metroStation["name"],
          placeId: metroStation["place_id"],
          rating: "",
          userRatingsTotal: "",
          vicinity: metroStation["address"],
          data: "",
          metro: metroData["name"],
          lines: lines,
          colourCodes: colourCodes,
          startStations: startStations,
          endStations: endStations);

      distance = "0";
    }

    // if (isOffline == true) {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? fromSearchRecoms = await isar.directions
    //       .filter()
    //       .timeLessThan(DateTime.now())
    //       .fromIdEqualTo(placeId)
    //       .sortByTimeDesc()
    //       .distinctByFromId()
    //       .findFirst();
    //   nearbyMetro = FromMetro.fromJson(fromSearchRecoms!.fromData.toString());
    // } else {
    //   var status = await Permission.location.request();

    //   nearbyMetro = await homeRepository.fetchFromNearestMetro(placeId);

    //   if (status.isGranted == true) {
    //     var locAccuracy = await Geolocator.getLocationAccuracy();
    //     Position accPos;
    //     if (locAccuracy == LocationAccuracyStatus.precise) {
    //       accPos = await Geolocator.getCurrentPosition();
    //     } else {
    //       accPos = await Geolocator.getCurrentPosition(
    //           desiredAccuracy: LocationAccuracy.low);
    //     }
    //     distance = Geolocator.distanceBetween(nearbyMetro.lat, nearbyMetro.lng,
    //             accPos.latitude, accPos.longitude)
    //         .toStringAsFixed(0);
    //   }
    // }
    emit(
      state.copyWith(
        user: user,
        status: HomeStatus.loaded,
        toData: nearbyMetro,
        isOffline: isOffline,
        distance: distance,
      ),
    );
  }
}

double distance(Location a, Location b) {
  const R = 6371; // Radius of the earth in km
  final dLat = _toRadians(b.latitude - a.latitude);
  final dLon = _toRadians(b.longitude - a.longitude);
  final lat1 = _toRadians(a.latitude);
  final lat2 = _toRadians(b.latitude);

  final x = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
  final y = 2 * atan2(sqrt(x), sqrt(1 - x));
  final distanceInKm = R * y; // Distance in km

  return distanceInKm;
}

double _toRadians(double degrees) {
  return degrees * (pi / 180);
}

Map<String, dynamic> findClosestStation(
    List<Map<String, dynamic>> locations, Location userLocation) {
  Map<String, dynamic> closestLocation = {};
  double minDistance = double.infinity;

  for (var i = 0; i < locations.length; i++) {
    final Location stationLoc = Location(
        locations[i]["coordinates"]["lat"], locations[i]["coordinates"]["lng"]);
    final distanceToLocation = distance(userLocation, stationLoc);
    //print(locations[i]);
    if (distanceToLocation < minDistance) {
      closestLocation = locations[i];
      minDistance = distanceToLocation;
      closestLocation["distance"] = minDistance;
    }
  }

  return closestLocation;
}
