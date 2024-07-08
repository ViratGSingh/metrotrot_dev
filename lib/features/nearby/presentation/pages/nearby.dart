import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/home/presentation/widgets/search_appbar.dart';
import 'package:app/features/nearby/presentation/cubit/nearby_cubit.dart';
import 'package:app/features/nearby/presentation/widgets/alt_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class NearbyPage extends StatefulWidget {
  final String? placeId;
  const NearbyPage({
    super.key,
    this.placeId,
  });

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  @override
  void initState() {
    if (widget.placeId != null) {
      context.read<NearbyCubit>().getNearbyMetros(widget.placeId ?? "");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearbyCubit, NearbyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Nearby Metros",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    );
                  },
                );
              }),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AltSearchAppBar(
                        title: state.locationName,
                        onChanged: context
                            .read<NearbyCubit>()
                            .getSearchRecommendations,
                        onLocation: context
                            .read<NearbyCubit>()
                            .getNearbyMetrosFromCurrentLocation,
                        isOffline: state.isOffline,
                      ),
                    ),
                    state.status == NearbyStatus.loaded
                        ? ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            itemCount: state.closestMetros.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, right: 10),
                                          child: CustomPaint(
                                            size: Size(36,
                                                36), // specify the size of the CustomPaint
                                            painter: MultiColorCirclePainter(
                                                colors:
                                                    state.closestMetros[index]
                                                        ["colour_codes"]),
                                          ),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  state.closestMetros[index]
                                                      ["name"],
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  "${state.closestMetros[index]["line_names"].join(", ")} Line",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 12,
                                                      color:
                                                          Colors.grey.shade700),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          child: Text(
                                            "${state.closestMetros[index]["distance"]} Km",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final url =
                                                'https://www.google.com/maps/dir/?api=1&origin=${state.locationName}&destination=${state.closestMetros[index]["name"]} Metro Station&travelmode=driving';
                                            await launch(url);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFBB23),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            width: 36,
                                            height: 36,
                                            child: Icon(Icons.directions,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                              color: Colors.black12,
                            ),
                          )
                        : state.status == NearbyStatus.loading
                            ? Container(
                                height:
                                    2 * MediaQuery.of(context).size.height / 3,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedLinePainter({
    this.dashWidth = 5.0,
    this.dashSpace = 5.0,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MultiColorCirclePainter extends CustomPainter {
  final List<Color> colors;

  MultiColorCirclePainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final sweepAngle = 2 * pi / colors.length;

    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * sweepAngle,
        sweepAngle,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
