// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

class MetroMapView extends StatefulWidget {
  final String metro;
  const MetroMapView({
    super.key,
    required this.metro,
  });

  @override
  State<MetroMapView> createState() => _MetroMapViewState();
}

class _MetroMapViewState extends State<MetroMapView> {
  @override
  void initState() {
    super.initState();
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset to the default orientation when leaving the page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final events = [];
  bool canScroll = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          physics: canScroll
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Listener(
                onPointerDown: (event) {
                  events.add(event.pointer);
                },
                onPointerUp: (event) {
                  events.clear();
                  setState(() {
                    canScroll = true;
                  });
                },
                onPointerMove: (event) {
                  if (events.length == 2) {
                    setState(() {
                      canScroll = false;
                    });
                    //   int sensitivity = 8;
                    //   if (event.delta.dy > sensitivity) {
                    //     // code for two finger swipe up event

                    //   } else if (event.delta.dy < -sensitivity) {
                    //     // code for two finger swipe down event

                    //   }
                  }
                },
                child: InteractiveViewer(
                  maxScale: 10,
                  child: Image.asset(
                    'assets/images/${widget.metro}_map.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Asd");
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
