import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isar/isar.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/to_search/data/models/recommendation.dart';
import 'package:app/features/to_search/data/repositories/from_search_repository.dart';

part 'to_search_state.dart';

class ToSearchCubit extends Cubit<ToSearchState> {
  final ToSearchRepository toSearchRepository;
  ToSearchCubit({required this.toSearchRepository})
      : super(ToSearchState.initial());

  getSearchRecommendations(String userId, String fromPlaceId, String location,
      bool isOffline, double lat, double lng) async {
    emit(state.copyWith(status: ToSearchStatus.loading));
    List<ToRecommendation> predictions = [];
    var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
    List<Directions> recoms;
    if (isOffline == false) {
      if (location.isEmpty == true) {
        //Personal Recoms
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db
            .collection("dest_history")
            .where("user_id", isEqualTo: userId)
            .where("from_place_id", isEqualTo: fromPlaceId)
            .orderBy("total_taps", descending: true)
            .orderBy("last_tapped_at", descending: true)
            .limit(5)
            .get()
            .then((query) {
          query.docs.forEach((personalRecom) {
            Map<String, dynamic> data = personalRecom.data();
            ToRecommendation dest = ToRecommendation(
                placeId: data["to_place_id"],
                main: data["to_name"],
                secondary: data["to_address"]);

            predictions.add(dest);
          });
        });
        // recoms = await isar.directions
        //     .where()
        //     .filter()
        //     .fromIdEqualTo(fromPlaceId)
        //     .sortByTimeDesc()
        //     .distinctByDestContent()
        //     .limit(5)
        //     .findAll();
        // recoms.forEach((Directions recom) {
        //   ToRecommendation dest = ToRecommendation.fromJson(
        //     recom.toData.toString(),
        //   );
        //   dest.main = recom.destMain.toString();
        //   dest.secondary = recom.destSecondary.toString();
        //   predictions.add(dest);
        // });
      } else {
        predictions = await toSearchRepository.getSearchRecommendations(
            location, lat, lng);
      }
    } else {
      isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      if (location.isEmpty == true) {
        recoms = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId)
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      } else {
        recoms = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId)
            .contentWordsElementStartsWith(location)
            .distinctByDestContent()
            .limit(5)
            .findAll();
      }

      recoms.forEach((Directions recom) {
        ToRecommendation dest = ToRecommendation.fromJson(
          recom.toData.toString(),
        );
        dest.main = recom.destMain.toString();
        dest.secondary = recom.destSecondary.toString();

        predictions.add(dest);
      });
    }
    emit(state.copyWith(status: ToSearchStatus.loaded, locations: predictions));
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
}
