import 'package:app/features/destination/presentation/pages/destination.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DestRecoms extends StatelessWidget {
  final List<DestTapData> recoms;
  final bool isOffline;
  final FromMetro fromMetro;
  final String fromDistance;
  final double fromLat;
  final double fromLng;
  final String tabName;
  final bool? isLoading;
  const DestRecoms(
      {Key? key,
      required this.recoms,
      required this.tabName,
      required this.isOffline,
      required this.fromDistance,
      required this.fromLat,
      required this.fromLng,
      required this.fromMetro,
      this.isLoading=true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: isLoading==false?recoms.length:5,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 12,
            ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                if(isLoading==false){
                  
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LocationPage(
                      isOffline: isOffline,
                      toPlaceId: recoms.elementAt(index).toPlaceId,
                      fromMetro: fromMetro,
                      name: recoms.elementAt(index).toName,
                      distance: fromDistance,
                      address: recoms.elementAt(index).toAddress,
                      fromLat: fromLat,
                      fromLng: fromLng,
                    ),
                  ),
                );
                }
              },
              child: HomeDestItem(
                isUpdating: isLoading??false,
                destDate: isLoading==false?DateFormat("dd-MM-yyyy HH:mm:ss")
                    .format(recoms.elementAt(index).lastTappedAt)
                    .toString():"",
                name: isLoading==false?recoms.elementAt(index).toName:"",
                address: isLoading==false?recoms.elementAt(index).toAddress:"",
                tabName: tabName,
              ));
        });
  }
}

class HomeDestItem extends StatelessWidget {
  final String destDate;
  final String name;
  final String address;
  final String tabName;
  final bool isUpdating;
  const HomeDestItem(
      {Key? key,
      required this.isUpdating,
      required this.destDate,
      required this.name,
      required this.address,
      required this.tabName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //padding: const EdgeInsets.all(15),
              constraints: BoxConstraints(minHeight: 120,),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Text(
                      tabName,
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  // // Padding(
                  //   padding: EdgeInsets.only(bottom: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Nearest Station",
                  //         style: GoogleFonts.notoSans(
                  //             color: Colors.white, fontSize: 16),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isUpdating == false
                            ? Text(
                                name,
                                style: GoogleFonts.notoSans(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            : Container(
                                height: 28,
                                padding: EdgeInsets.only(bottom: 10),
                                width:
                                    2 * MediaQuery.of(context).size.width / 3,
                                child: LinearProgressIndicator(),
                              ),
                        isUpdating == false
                            ? Text(address,
                                style: GoogleFonts.notoSans(
                                    color: Colors.black, fontSize: 14))
                            : Container(
                                height: 28,
                                width:
                                    2 * MediaQuery.of(context).size.width / 3,
                                child: LinearProgressIndicator(),
                              )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: isUpdating == false
                        ? Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                            child: Text(destDate,
                                style: GoogleFonts.notoSans(
                                    color: Colors.black, fontSize: 12)),
                          )
                        : Container(
                            height: 28,
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            child: LinearProgressIndicator(),
                          ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
