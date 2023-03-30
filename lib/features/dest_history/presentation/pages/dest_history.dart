// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/dest_history/presentation/cubit/dest_history_cubit.dart';
import 'package:app/features/destination/presentation/widgets/nearestTo.dart';
import 'package:app/features/home/presentation/widgets/nearestFrom.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/dest_history/presentation/widgets/destination.dart';
import 'package:app/features/dest_history/presentation/widgets/location.dart';
import 'package:app/features/destination/presentation/cubit/dest_metro_cubit.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';

class DestHistoryPage extends StatefulWidget {
  final FromMetro fromMetro;
  final bool isOffline;
  final String userId;
  const DestHistoryPage({
    Key? key,
    required this.userId,
    required this.fromMetro,
    required this.isOffline,
  }) : super(key: key);

  @override
  State<DestHistoryPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<DestHistoryPage> {
  @override
  void initState() {
    context
        .read<DestHistoryCubit>()
        .getDestHistory(widget.userId, widget.isOffline, widget.fromMetro,Timestamp.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestHistoryCubit, DestHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: Colors.white,
            leadingWidth: 40,
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            // leading: Padding(
            //   padding: EdgeInsets.only(left: 0),
            //   child: IconButton(
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Get.back();
            //     },
            //   ),
            // ),
            titleSpacing: 0,
            title: Text(
              "Location History",
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
              child: LocHeader(
                  name: widget.fromMetro.name,
                  address: widget.fromMetro.vicinity),
            ),
            Expanded(
              child: CustomRefreshIndicator(
                trigger: IndicatorTrigger.trailingEdge,
                onRefresh: () {
                  Timestamp lastTimestamp = Timestamp.fromDate(state.destData.last.lastTappedAt);
                  //print(lastTimestamp);
                  return context.read<DestHistoryCubit>().updateDestHistory(
                      widget.userId, widget.isOffline, widget.fromMetro,state.destData , lastTimestamp);
                },
                builder: (
                  BuildContext context,
                  Widget child,
                  IndicatorController controller,
                ) {
                  /// TODO: Implement your own refresh indicator
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      /// The scroll widget that was passed as the [child] argument.
                      ///
                      /// TIP:
                      /// You can also wrap [child] with the [Transform] widget to also animate the list transformation (see the example app).
                      child,

                      /// Your indicator implementation
                      controller.isLoading==true ?CircularProgressIndicator():SizedBox.shrink()
                    ],
                  );
                },
                child: ListView.separated(
                  itemCount: state.destData.isEmpty == true
                      ? 10
                      : state.destData.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DestItem(
                        destDate: state.destData.isEmpty != true
                            ? state.destData
                                .elementAt(index)
                                .lastTappedAt
                                .toString()
                            : "",
                        name: state.destData.isEmpty != true
                            ? state.destData.elementAt(index).toName
                            : "",
                        address: state.destData.isEmpty != true
                            ? state.destData.elementAt(index).toAddress
                            : "",
                        isUpdating: state.status == DestHistoryStatus.loading
                            ? true
                            : false,
                      ),
                    );
                  },
                ),
              ),
            )

            // Obx(() {
            //   return controller.guideUser(controller.guideState.value);
            // })
          ]),
        ));
      },
    );
  }
}
