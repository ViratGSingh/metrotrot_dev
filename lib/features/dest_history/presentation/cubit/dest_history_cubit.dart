import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'dest_history_state.dart';

class DestHistoryCubit extends Cubit<DestHistoryState> {
  DestHistoryCubit()
      : super(
          DestHistoryState.initial(),
        );

  updateDestHistory(String userId, bool isOffline, FromMetro fromMetro,
      List<DestTapData> oldData, Timestamp endTimestamp) async {
    emit(state.copyWith(
        fromMetro: fromMetro,
        destData: oldData,
        isOffline: isOffline));
    List<DestTapData> newData = [];
    newData.addAll(oldData);
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection("dest_history")
        .where("user_id", isEqualTo: userId)
        .where("from_place_id", isEqualTo: fromMetro.placeId)
        .orderBy("last_tapped_at", descending: true)
        .startAt([endTimestamp])
        .limit(5)
        .get()
        .then((value) {
          value.docs.forEach((element) {
            DestTapData newDest = DestTapData.fromMap(
              element.data(),
            );
            //print(newDest);
            if (newData.contains(newDest) != true) {
              newData.add(
                newDest,
              );
            }
          });
        });
    
    emit(state.copyWith(
      status: DestHistoryStatus.loaded,
        fromMetro: fromMetro,
        destData: newData,
        isOffline: isOffline));
  }

  getDestHistory(String userId, bool isOffline, FromMetro fromMetro,
      Timestamp lastTimestamp) async {
    emit(state.copyWith(
        status: DestHistoryStatus.loading,
        fromMetro: fromMetro,
        destData: [],
        isOffline: isOffline));
    List<DestTapData> destData = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection("dest_history")
        .where("user_id", isEqualTo: userId)
        .where("from_place_id", isEqualTo: fromMetro.placeId)
        .orderBy("last_tapped_at", descending: true)
        .limit(10)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        destData.add(
          DestTapData.fromMap(
            element.data(),
          ),
        );
      });
    });
    emit(state.copyWith(
        status: DestHistoryStatus.loaded,
        fromMetro: fromMetro,
        destData: destData,
        isOffline: isOffline));

    // String destSearchId = "${userId}_${fromMetro.placeId}_$toPlaceId";
    // db.collection("dest_history").doc(destSearchId).get().then((value) {
    //   if (value.exists) {
    //     //Update User Info
    //     Map<String, dynamic>? oldData = value.data();
    //     if (oldData != null) {
    //       DestTapData oldDestData = DestTapData.fromMap(oldData);
    //       destData.totalTaps = oldDestData.totalTaps + 1;
    //       destData.firstTappedAt = oldDestData.firstTappedAt;
    //     }
    //     destData.lastTappedAt = DateTime.now();

    //     db
    //         .collection("dest_history")
    //         .doc(destSearchId)
    //         .update(destData.toMap())
    //         .onError((e, _) => print("Error writing document: $e"));
    //   } else {
    //     //Set First Time Info
    //     db
    //         .collection("dest_history")
    //         .doc(destSearchId)
    //         .set(destData.toMap())
    //         .onError((e, _) => print("Error writing document: $e"));
    //   }
    //});
  }
}
