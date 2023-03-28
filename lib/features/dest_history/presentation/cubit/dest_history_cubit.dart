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

  getDestHistory(String userId, bool isOffline, FromMetro fromMetro) async {
    emit(state.copyWith(
        status: DestHistoryStatus.loading,
        fromMetro: fromMetro,
        isOffline: isOffline));
    FirebaseFirestore db = FirebaseFirestore.instance;
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
