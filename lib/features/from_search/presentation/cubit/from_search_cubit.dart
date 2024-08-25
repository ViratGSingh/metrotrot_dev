import 'dart:convert';
import 'dart:io';

import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/from_search/data/models/from_search_info.dart';
import 'package:app/features/to_search/data/models/dest_search_info.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:app/widgets/popups/enable_notifications.dart';
import 'package:app/widgets/popups/success.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:isar/isar.dart';
import 'package:app/features/from_search/data/models/from_recommendation.dart';
import 'package:app/features/from_search/data/repositories/from_search_repository.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

part 'from_search_state.dart';

class FromSearchCubit extends Cubit<FromSearchState> {
  final FromSearchRepository fromSearchRepository;
  FromSearchCubit({required this.fromSearchRepository})
      : super(FromSearchState.initial());

  Future<List<FromRecommendation>> getSuggestedStations(String location) async {
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
    final List<FromRecommendation> stationSuggestions = [];
    final String lowercaseQuery = location.toLowerCase();
    for (final station in metroStations) {
      FromRecommendation stationRecom = FromRecommendation(
          placeId: station["place_id"],
          main: station["name"],
          secondary: station["address"]);
      if ((station["name"] + station["address"])
          .toLowerCase()
          .contains(lowercaseQuery)) {
        if (stationSuggestions.contains(stationRecom) == false) {
          stationSuggestions.add(stationRecom);
        }
      }
    }
    return stationSuggestions;
  }

  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(dotenv.env["MIXPANEL_PROJECT_ID"].toString(),
        trackAutomaticEvents: false);
    //Track event
    mixpanel.track("openedFromSearchPage");
  }

  Future<void> updateSavedFromRecommendation(
      FromRecommendation recommendation, bool isFavourite) async {
    String placeId = recommendation.placeId;
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ]);
    //Check place id exists in From recommendations
    final savedRecommendation = await isar.savedFromRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (savedRecommendation != null) {
      await isar.writeTxn(() async {
        savedRecommendation.isFavourite = isFavourite;
        await isar.savedFromRecommendations.put(savedRecommendation);
      });
    }
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

  void showRewardedAd(BuildContext context) {
    mixpanel.track("startFromRewardedAd");
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
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      updateFromSearchLimit();
      mixpanel.track("finishFromRewardedAd");
      emit(state.copyWith(isRewardGranted: true));
    });
    rewardedAd = null;
  }

  Future<bool> checkFromSearchLimit(BuildContext context) async {
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ]);
    int totalFavourites = await isar.savedFromRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .count();

    int totalRecommendations = await isar.savedFromRecommendations.count();

    FromSearchInfo? fromSearchInfo;

    bool reachedLimit = false;

    print(isar.fromSearchInfos);
    bool isBlank = isar.fromSearchInfos.isBlank ?? false;

    if (isBlank) {
      reachedLimit = false;

      fromSearchInfo = FromSearchInfo()
        ..id = 1
        ..isLimitreached = false
        ..startedAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..totalFavourites = totalFavourites
        ..totalRecommendations = totalRecommendations;
    } else {
      await isar.fromSearchInfos.get(1).then((info) {
        fromSearchInfo = info;
      });
      int newSavedSourceLocations =
          totalRecommendations - (fromSearchInfo?.totalRecommendations ?? 0);
      print(newSavedSourceLocations);
      print("New Searches");
      if (newSavedSourceLocations >= 20) {
        reachedLimit = true;
      } else {
        reachedLimit = false;
      }

      fromSearchInfo = FromSearchInfo()
        ..id = 1
        ..isLimitreached = reachedLimit
        ..startedAt = fromSearchInfo?.startedAt
        ..updatedAt = DateTime.now()
        ..totalFavourites = fromSearchInfo?.totalFavourites
        ..totalRecommendations = fromSearchInfo?.totalRecommendations;
    }

    // if (totalRecommendations >= 50) {
    //   reachedLimit = true;
    // } else {
    //   if (isBlank == true) {
    //   } else {
    //     }
    await isar.writeTxn(() async {
      await isar.fromSearchInfos.put(fromSearchInfo!);
    });

    print(totalRecommendations);
    print(totalFavourites);
    print(reachedLimit);
    return reachedLimit;
  }

  Future<void> updateFromSearchLimit() async {
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ]);
    int totalFavourites = await isar.savedFromRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .count();

    int totalRecommendations = await isar.savedFromRecommendations.count();

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
  getSearchRecommendations(String location, BuildContext context) async {
    emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loading,
        placeStatus: FromSearchPlaceStatus.loading));

    List<FromRecommendation> predictions = [];
    List<FromRecommendation> stationSuggestions = [];

    stationSuggestions = await getSuggestedStations(location);
    //print(stationSuggestions);
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema,
          FromSearchInfoSchema,
          DestSearchInfoSchema
        ]);
    if (searchLimitChecked == false) {
      // ignore: use_build_context_synchronously
      reachedLimit = await checkFromSearchLimit(context);
    }
    //Suggested Places
    //Check for saved places

    List<FromRecommendation> favSavedPredictions = [];
    List<FromRecommendation> nonFavSavedPredictions = [];
    final savedRecommendations = await isar.savedFromRecommendations
        .filter()
        .fromContentContains(location, caseSensitive: false)
        .findAll();
    for (SavedFromRecommendation savedRecommendation in savedRecommendations) {
      FromRecommendation updSavedRecommendation = FromRecommendation(
          placeId: savedRecommendation.placeId ?? "",
          main: savedRecommendation.main ?? "",
          secondary: savedRecommendation.secondary ?? "",
          isFavourite: savedRecommendation.isFavourite ?? false);
      if (updSavedRecommendation.isFavourite == true) {
        favSavedPredictions.add(updSavedRecommendation);
      } else {
        nonFavSavedPredictions.add(updSavedRecommendation);
      }
    }
    //Add all fav saved recommendations
    predictions.addAll(favSavedPredictions);
    predictions.addAll(nonFavSavedPredictions);

    await isar.savedFromRecommendations.count().then((totalRecommendations) {
      print("search limit checked");
      print(searchLimitChecked);
      if (reachedLimit == true && searchLimitChecked == false) {
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return SearchLimitReachedPopup(
                title: "Warning",
                message:
                    "You've reached your limit for searching source locations online. Please watch a 5-second ad to unlock additional searches.", //\n\n Alternatively, you can continue searching from the $totalRecommendations saved recommendations available right now.",
                action: "Back",
                actionFunc: () {
                  Navigator.pop(context);
                  showRewardedAd(context);

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
        searchLimitChecked = true;
      }
    });
    //Get new places
    if (predictions.isEmpty == true && reachedLimit == false) {
      await fromSearchRepository
          .getSearchRecommendations(location)
          .then((value) async {
        predictions = value;
        for (FromRecommendation recommendation in predictions) {
          SavedFromRecommendation newPlace = SavedFromRecommendation()
            ..placeId = recommendation.placeId
            ..main = recommendation.main
            ..secondary = recommendation.secondary
            ..totaltaps = 1
            ..firstTapDate = DateTime.now()
            ..lastTapDate = DateTime.now()
            ..isFavourite = false
            ..fromContent = recommendation.main;
          await isar.writeTxn(() async {
            await isar.savedFromRecommendations.put(newPlace);
          });
        }
      });
    }
    // else if (predictions.isEmpty == true && reachedLimit == true) {
    //   await isar.savedFromRecommendations.count().then((totalRecommendations) {
    //     print("search limit checked");
    //     print(searchLimitChecked);
    //     if (searchLimitChecked == false) {
    //       showDialog(
    //           // ignore: use_build_context_synchronously
    //           context: context,
    //           builder: (BuildContext context) {
    //             return SearchLimitReachedPopup(
    //               title: "Warning",
    //               message:
    //                   "You've reached your limit for searching source locations online. Please watch a 5-second ad to unlock additional searches.\n\n Alternatively, you can continue searching from the $totalRecommendations saved recommendations available right now.",
    //               action: "Back",
    //               actionFunc: () async {
    //                 Navigator.pop(context);
    //                 showRewardedAd(context);
    //                 //launchUrl(Uri.parse("https://www.threads.net/@viratgsingh"));
    //                 // Navigator.push(
    //                 //   context,
    //                 //   MaterialPageRoute<void>(
    //                 //     builder: (BuildContext context) => const HomePa,
    //                 //   ),
    //                 // );
    //               },
    //             );
    //           });
    //           searchLimitChecked = true;
    //     }
    //   });
    //}
    emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loaded,
        placeStatus: FromSearchPlaceStatus.loaded,
        locations: predictions.take(5).toList(),
        stations: stationSuggestions.take(5).toList()));
  }
}
