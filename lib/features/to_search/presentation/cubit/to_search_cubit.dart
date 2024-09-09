import 'dart:convert';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/from_search/data/models/from_search_info.dart';
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/to_search/data/models/dest_search_info.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:app/models/location.dart';
import 'package:app/widgets/popups/enable_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:math';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/to_search/data/models/recommendation.dart';
import 'package:app/features/to_search/data/repositories/from_search_repository.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
part 'to_search_state.dart';

class ToSearchCubit extends Cubit<ToSearchState> {
  final ToSearchRepository toSearchRepository;
  ToSearchCubit({required this.toSearchRepository})
      : super(ToSearchState.initial());

  Future<void> updateDestFavRecommendation(
      ToRecommendation recommendation, bool isFavourite) async {
    String placeId = recommendation.placeId;
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ], directory: dir.path);
    //Check place id exists in From recommendations
    final savedRecommendation = await isar.savedToRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (savedRecommendation != null) {
      await isar.writeTxn(() async {
        savedRecommendation.isFavourite = isFavourite;
        await isar.savedToRecommendations.put(savedRecommendation);
      });
    }
  }

  Future<List<ToRecommendation>> getSuggestedStations(String location) async {
    //Get Stations
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    List<Map<String, dynamic>> metroStations = [];
    int metroLines = metroData["total_lines"];
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      lineData.forEach((element) {
        Map<String, dynamic> stationData = element;
        if (metroStations.contains(stationData) == false) {
          metroStations.add(stationData);
        } else {
          //print(stationData);
        }
      });
      //metroStations.addAll(lineData);
    }

    //Suggested Stations
    final List<ToRecommendation> stationSuggestions = [];
    final String lowercaseQuery = location.toLowerCase();
    for (final station in metroStations) {
      if ((station["name"] + station["address"])
          .toLowerCase()
          .contains(lowercaseQuery)) {
        ToRecommendation stationRecom = ToRecommendation(
            placeId: station["place_id"],
            main: station["name"],
            secondary: station["address"]);
        if (stationSuggestions.contains(stationRecom) == false) {
          stationSuggestions.add(stationRecom);
        }
      }
    }
    return stationSuggestions;
  }

  RewardedAd? rewardedAd;
  int numRewardedLoadAttempts = 0;

  void initialisationAds() {
    MobileAds.instance.updateRequestConfiguration(RequestConfiguration());
    _createRewardedAd();
  }

  void _createRewardedAd() {
    AdRequest request = const AdRequest();
    int maxFailedLoadAttempts = 3;
    RewardedAd.load(
        adUnitId: "ca-app-pub-8353447747212760/1167847364",
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            rewardedAd = ad;
            numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            rewardedAd = null;
            numRewardedLoadAttempts += 1;
            if (numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  Future<void> initPlatformState() async {
    await Purchases.setDebugLogsEnabled(true);
    PurchasesConfiguration configuration;
    configuration =
        PurchasesConfiguration(dotenv.env["REVENUECAT_API_KEY"].toString());
    await Purchases.configure(configuration);
  }

  Future<void> showPremiumPackage() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.getOffering("Premium Access")?.availablePackages != null) {
        // Display packages for sale
        Offering? premiumOffering = offerings.getOffering("Premium Access");
        await RevenueCatUI.presentPaywall(
                offering: premiumOffering, displayCloseButton: true)
            .then((result) {
          if (result == PaywallResult.purchased) {
            updateSearchLimit();
            mixpanel.track("finishDestPremiumPurchase");
            emit(state.copyWith(isRewardGranted: true));
          }
        });
      }
    } on PlatformException catch (e) {
      // optional error handling
    }
  }

  void checkUserPremiumStatus() async {
    await initPlatformState();
    CustomerInfo purchaserInfo = await Purchases.restorePurchases();
    _handleCustomerUpdate(purchaserInfo);
  }

  void _handleCustomerUpdate(CustomerInfo purchaserInfo) {
    if (purchaserInfo.entitlements.all["Premium Access"]?.isActive == true) {
      updateSearchLimit();
    }
  }

  void showRewardedAd(BuildContext context, String destinationId) {
    mixpanel.track("startDestRewardedAd");
    if (rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    rewardedAd!.setImmersiveMode(true);
    rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      // print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      // updateDestSearchLimit();
      // mixpanel.track("finishDestRewardedAd");
      // emit(state.copyWith(isRewardGranted: true));
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => HomePage(
            isFromSearch: false,
            placeId: destinationId,
            isFromOffline: false,
          ),
        ),
      );
    });
    rewardedAd = null;
  }

  Future<bool> checkDestSearchLimit(BuildContext context) async {
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ], directory: dir.path);
    int totalFavourites = await isar.savedToRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .count();

    int totalFromRecommendations = await isar.savedFromRecommendations.count();
    int totalDestRecommendations = await isar.savedToRecommendations.count();
    int totalRecommendations =
        totalFromRecommendations + totalDestRecommendations;

    DestSearchInfo? destSearchInfo;

    bool isLimitReached = false;

    bool isBlank = isar.destSearchInfos.isBlank ?? false;

    if (isBlank) {
      isLimitReached = false;

      destSearchInfo = DestSearchInfo()
        ..id = 1
        ..isLimitreached = false
        ..startedAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..totalFavourites = totalFavourites
        ..totalRecommendations = totalDestRecommendations;
    } else {
      await isar.destSearchInfos.get(1).then((info) {
        destSearchInfo = info;
      });
      FromSearchInfo? fromSearchInfo = await isar.fromSearchInfos.get(1);
      int newSavedDestLocations = totalRecommendations -
          (destSearchInfo?.totalRecommendations ?? 0) -
          (fromSearchInfo?.totalRecommendations ?? 0);
      print(newSavedDestLocations);
      print("New Searches");
      if (newSavedDestLocations >= 50) {
        isLimitReached = true;
      } else {
        isLimitReached = false;
      }

      destSearchInfo = DestSearchInfo()
        ..id = 1
        ..isLimitreached = isLimitReached
        ..startedAt = destSearchInfo?.startedAt
        ..updatedAt = DateTime.now()
        ..totalFavourites = destSearchInfo?.totalFavourites
        ..totalRecommendations = destSearchInfo?.totalRecommendations;
    }

    // if (totalRecommendations >= 50) {
    //   reachedLimit = true;
    // } else {
    //   if (isBlank == true) {
    //   } else {
    //     }
    await isar.writeTxn(() async {
      await isar.destSearchInfos.put(destSearchInfo!);
    });

    return isLimitReached;
  }

  Future<void> updateSearchLimit() async {
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ], directory: dir.path);
    int totalFavourites = await isar.savedToRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .count();

    int totalRecommendations = await isar.savedToRecommendations.count();

    DestSearchInfo? destSearchInfo;
    await isar.destSearchInfos.get(1).then((info) {
      destSearchInfo = info;
    });
    destSearchInfo = DestSearchInfo()
      ..id = 1
      ..isLimitreached = false
      ..startedAt = destSearchInfo?.startedAt
      ..updatedAt = DateTime.now()
      ..totalFavourites = totalFavourites
      ..totalRecommendations = totalRecommendations;

    await isar.writeTxn(() async {
      await isar.destSearchInfos.put(destSearchInfo!);
    });

    //Update From Search Info
    totalFavourites = await isar.savedFromRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .count();

    totalRecommendations = await isar.savedFromRecommendations.count();

    FromSearchInfo? fromSearchInfo;
    await isar.fromSearchInfos.get(1).then((info) {
      fromSearchInfo = info;
    });
    fromSearchInfo = FromSearchInfo()
      ..id = 1
      ..isLimitreached = false
      ..startedAt = fromSearchInfo?.startedAt
      ..updatedAt = DateTime.now()
      ..totalFavourites = totalFavourites
      ..totalRecommendations = totalRecommendations;

    await isar.writeTxn(() async {
      await isar.fromSearchInfos.put(fromSearchInfo!);
    });
    reachedLimit = false;
    searchLimitChecked = false;
  }

  bool reachedLimit = false;
  bool searchLimitChecked = false;

  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(dotenv.env["MIXPANEL_PROJECT_ID"].toString(),
        trackAutomaticEvents: false);
    mixpanel.track("openedDestSearchPage");
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
      final Location stationLoc = Location(locations[i]["coordinates"]["lat"],
          locations[i]["coordinates"]["lng"]);
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

  Future<void> altBackgroundSavedInfo(ToRecommendation prediction) async {
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ], directory: dir.path);
    List<SavedFromMetro> savedFromPlaceInfo = await isar.savedFromMetros
        .filter()
        .placeIdEqualTo(prediction.placeId)
        .findAll();

    List<SavedDestMetro> savedDestPlaceInfo = await isar.savedDestMetros
        .filter()
        .placeIdEqualTo(prediction.placeId)
        .findAll();

    if (savedFromPlaceInfo.isEmpty && savedDestPlaceInfo.isEmpty) {
      double lat = prediction.lat;
      double lng = prediction.lng;
      // destName = placeInfo["name"];
      // destAddress = placeInfo["formatted_address"];

      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      //print(metroLines);
      final userLocation = Location(lat, lng); // User's location
      List<Map<String, dynamic>> metroStations = [];
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        lineData.forEach((element) {
          Map<String, dynamic> stationData = element;
          metroStations.add(stationData);
        });
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
      lineKeys.forEach((element) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      });

      //Save the destination location info
      SavedDestMetro formattedDestMetro = SavedDestMetro()
        ..destName = prediction.main
        ..destAddress = prediction.secondary
        ..businessStatus =
            closestLocation["is_interchange"] == true ? "Yes" : "No"
        ..destLat = lat
        ..destLng = lng
        ..nearbyMetroLat = closestLocation["coordinates"]["lat"]
        ..nearbyMetroLng = closestLocation["coordinates"]["lng"]
        ..name = closestLocation["name"]
        ..placeId = prediction.placeId
        ..rating = ""
        ..userRatingsTotal = ""
        ..vicinity = closestLocation["address"]
        ..data = ""
        ..metro = metroData["name"]
        ..lines = lines
        ..colourCodes = colourCodes
        ..startStations = startStations
        ..endStations = endStations
        ..destContent = prediction.main;

      await isar.writeTxn(() async {
        await isar.savedDestMetros.put(formattedDestMetro);
      });

      SavedFromMetro formattedFromMetro = SavedFromMetro()
        ..fromName = prediction.main
        ..fromAddress = prediction.secondary
        ..businessStatus =
            closestLocation["is_interchange"] == true ? "Yes" : "No"
        ..fromLat = lat
        ..fromLng = lng
        ..lat = closestLocation["coordinates"]["lat"]
        ..lng = closestLocation["coordinates"]["lng"]
        ..name = closestLocation["name"]
        ..placeId = prediction.placeId
        ..rating = ""
        ..userRatingsTotal = ""
        ..vicinity = closestLocation["address"]
        ..data = ""
        ..metro = metroData["name"]
        ..lines = lines
        ..colourCodes = colourCodes
        ..startStations = startStations
        ..endStations = endStations
        ..fromContent = prediction.main;
      await isar.writeTxn(() async {
        await isar.savedFromMetros.put(formattedFromMetro);
      });
    }
  }

  Future<void> backgroundSavedInfo(
      String placeId, String destName, String destAddress) async {
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ], directory: dir.path);
    List<SavedFromMetro> savedFromPlaceInfo =
        await isar.savedFromMetros.filter().placeIdEqualTo(placeId).findAll();

    List<SavedDestMetro> savedDestPlaceInfo =
        await isar.savedDestMetros.filter().placeIdEqualTo(placeId).findAll();

    if (savedFromPlaceInfo.isEmpty && savedDestPlaceInfo.isEmpty) {
      Map<String, dynamic> placeInfo =
          await toSearchRepository.fetchNearestMetro(placeId);
      print(placeInfo);
      double lat = placeInfo["geometry"]["location"]["lat"];
      double lng = placeInfo["geometry"]["location"]["lng"];
      // destName = placeInfo["name"];
      // destAddress = placeInfo["formatted_address"];

      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      //print(metroLines);
      final userLocation = Location(lat, lng); // User's location
      List<Map<String, dynamic>> metroStations = [];
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        lineData.forEach((element) {
          Map<String, dynamic> stationData = element;
          metroStations.add(stationData);
        });
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
      lineKeys.forEach((element) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      });

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

      SavedFromMetro formattedFromMetro = SavedFromMetro()
        ..fromName = destName
        ..fromAddress = destAddress
        ..businessStatus =
            closestLocation["is_interchange"] == true ? "Yes" : "No"
        ..fromLat = lat
        ..fromLng = lng
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
        ..fromContent = destName;
      await isar.writeTxn(() async {
        await isar.savedFromMetros.put(formattedFromMetro);
      });
    }
  }

  getSearchRecommendations(
      //String userId, String fromPlaceId,
      String location,
      bool isOffline,
      double lat,
      double lng,
      BuildContext context) async {
    emit(state.copyWith(
        stationStatus: ToSearchStationStatus.loading,
        placeStatus: ToSearchPlaceStatus.loading));
    List<ToRecommendation> predictions = [];
    List<ToRecommendation> stationSuggestions = [];
    if (location == "") {
      emit(state.copyWith(
          stationStatus: ToSearchStationStatus.loaded,
          placeStatus: ToSearchPlaceStatus.loaded,
          locations: predictions.take(5).toList(),
          stations: stationSuggestions.take(5).toList()));
    } else {
      stationSuggestions = await getSuggestedStations(location);
      //print(stationSuggestions);
      final dir = await getApplicationDocumentsDirectory();
      Isar isar = Isar.getInstance() ??
          await Isar.open([
            DirectionsSchema,
            SavedFromRecommendationSchema,
            SavedToRecommendationSchema,
            SavedFromMetroSchema,
            SavedDestMetroSchema
          ], directory: dir.path);

      if (searchLimitChecked == false) {
        // ignore: use_build_context_synchronously
        print("check limit");
        reachedLimit = await checkDestSearchLimit(context);
      }

      //Suggested Places
      //Check for saved places

      List<ToRecommendation> favSavedPredictions = [];
      List<ToRecommendation> nonFavSavedPredictions = [];
      final savedRecommendations = await isar.savedToRecommendations
          .filter()
          .destContentContains(location, caseSensitive: false)
          .findAll();
      for (SavedToRecommendation savedRecommendation in savedRecommendations) {
        ToRecommendation updSavedRecommendation = ToRecommendation(
            placeId: savedRecommendation.placeId ?? "",
            main: savedRecommendation.main ?? "",
            secondary: savedRecommendation.secondary ?? "",
            lat: savedRecommendation.lat ?? 0,
            lng: savedRecommendation.lng ?? 0,
            isFavourite: savedRecommendation.isFavourite ?? false);
        if (updSavedRecommendation.isFavourite == true) {
          favSavedPredictions.add(updSavedRecommendation);
        } else {
          nonFavSavedPredictions.add(updSavedRecommendation);
        }
      }

      //Check in Source Locations
      final savedFromRecommendations = await isar.savedFromRecommendations
          .filter()
          .fromContentContains(location, caseSensitive: false)
          .findAll();
      for (SavedFromRecommendation savedRecommendation
          in savedFromRecommendations) {
        ToRecommendation updSavedRecommendation = ToRecommendation(
            placeId: savedRecommendation.placeId ?? "",
            main: savedRecommendation.main ?? "",
            secondary: savedRecommendation.secondary ?? "",
            lat: savedRecommendation.lat ?? 0,
            lng: savedRecommendation.lng ?? 0,
            isFavourite: false);
        if (nonFavSavedPredictions.contains(updSavedRecommendation) == false) {
          nonFavSavedPredictions.add(updSavedRecommendation);
        }
      }

      //Add all fav saved recommendations
      predictions.addAll(favSavedPredictions);
      predictions.addAll(nonFavSavedPredictions);

      await isar.savedToRecommendations.count().then((totalRecommendations) {
        print("search limit checked");
        print(searchLimitChecked);
        print(reachedLimit);
        if (reachedLimit == true && searchLimitChecked == false) {
          showPremiumPackage();
          // showDialog(
          //     // ignore: use_build_context_synchronously
          //     context: context,
          //     builder: (BuildContext context) {
          //       return SearchLimitReachedPopup(
          //         title: "Warning",
          //         message:
          //             "You've reached your limit for searching source locations online. Please watch a 5-second ad to unlock additional searches.", //\n\n Alternatively, you can continue searching from the $totalRecommendations saved recommendations available right now.",
          //         action: "Back",
          //         actionFunc: () {
          //           Navigator.pop(context);
          //           showRewardedAd(context);

          //           //launchUrl(Uri.parse("https://www.threads.net/@viratgsingh"));
          //           // Navigator.push(
          //           //   context,
          //           //   MaterialPageRoute<void>(
          //           //     builder: (BuildContext context) => const HomePa,
          //           //   ),
          //           // );
          //         },
          //       );
          //     });
          searchLimitChecked = true;
        }
      });

      //Get new places
      if (predictions.isEmpty == true && reachedLimit == false) {
        await toSearchRepository
            .getAltSearchRecommendations(location)
            .then((value) async {
          predictions = value;
          for (ToRecommendation recommendation in predictions) {
            SavedToRecommendation newPlace = SavedToRecommendation()
              ..placeId = recommendation.placeId
              ..main = recommendation.main
              ..secondary = recommendation.secondary
              ..totaltaps = 1
              ..lat = recommendation.lat
              ..lng = recommendation.lng
              ..firstTapDate = DateTime.now()
              ..lastTapDate = DateTime.now()
              ..isFavourite = false
              ..destContent = recommendation.main;
            await isar.writeTxn(() async {
              await isar.savedToRecommendations.put(newPlace);
            });
          }
        });
      }
      for (ToRecommendation prediction in predictions) {
        if (prediction.lat != 0 && prediction.lng != 0) {
          altBackgroundSavedInfo(prediction);
        } else {
          backgroundSavedInfo(
              prediction.placeId, prediction.main, prediction.secondary);
        }
      }

      await Future.delayed(Duration(milliseconds: 800));
      emit(state.copyWith(
          stationStatus: ToSearchStationStatus.loaded,
          placeStatus: ToSearchPlaceStatus.loaded,
          locations: predictions.take(5).toList(),
          stations: stationSuggestions.take(5).toList()));
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
    String destSearchId = const Uuid().v4();
    //"${userId}_${fromMetro.placeId}_$toPlaceId";
    db
        .collection("dest_history")
        .doc(destSearchId)
        .set(destData.toMap())
        .onError((e, _) => print("Error writing document: $e"));
    // db.collection("dest_history").doc(destSearchId).get().then((value) {
    //   // if (value.exists) {
    //   //   //Update User Info
    //   //   Map<String, dynamic>? oldData = value.data();
    //   //   if (oldData != null) {
    //   //     DestTapData oldDestData = DestTapData.fromMap(oldData);
    //   //     destData.totalTaps = oldDestData.totalTaps + 1;
    //   //     destData.firstTappedAt = oldDestData.firstTappedAt;
    //   //     destData.isLiked = oldDestData.isLiked;
    //   //   }
    //   //   destData.lastTappedAt = DateTime.now();
    //   //   db
    //   //       .collection("dest_history")
    //   //       .doc(destSearchId)
    //   //       .update(destData.toMap())
    //   //       .onError((e, _) => print("Error writing document: $e"));
    //   // }
    //    //else {
    //     //Set First Time Info
    //     db
    //         .collection("dest_history")
    //         .doc(destSearchId)
    //         .set(destData.toMap())
    //         .onError((e, _) => print("Error writing document: $e"));
    //   //}
    // });
  }
}
