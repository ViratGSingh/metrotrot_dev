// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:app/features/directions/presentation/widgets/directions/directions.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';

class DirectionsPage extends StatefulWidget {
  final FromMetro fromMetro;
  final DestMetro destMetro;
  final String destination;
  final String fromDistance;
  final String toDistance;
  final String destName;
  final String destAddress;
  final bool isOffline;
  const DirectionsPage({
    Key? key,
    required this.fromMetro,
    required this.destMetro,
    required this.destination,
    required this.fromDistance,
    required this.toDistance,
    required this.destName,
    required this.destAddress,
    required this.isOffline,
  }) : super(key: key);

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  @override
  void initState() {
    context.read<DirectionsCubit>().getDirections(
        widget.fromMetro,
        widget.destMetro,
        widget.destName,
        widget.destAddress,
        widget.isOffline);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectionsCubit, DirectionsState>(
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
                leading: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                      //controller.search.close();
                      //Get.back();
                    },
                  ),
                ),
                titleSpacing: 0,
                title: Text(
                  "Directions",
                  style: GoogleFonts.notoSans(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              body: state.status == DirectionsStatus.loaded
                  ? Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Center(
                        child: MetroDirections(
                            destMetro: widget.destMetro,
                            fromDistance: widget.fromDistance,
                            toDistance: widget.toDistance,
                            routeCost: state.routeData.routeCost,
                            directions: state.routeData.route,
                            destination: widget.destination),
                      ),
                    )
                  // : Padding(
                  //     padding: EdgeInsets.all(15),
                  //     child: ErrorDirections(),
                  //   )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
        );
      },
    );
  }
}
