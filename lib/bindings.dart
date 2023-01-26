import 'dart:convert';
import 'package:app/controllers/directions.dart';
import 'package:app/controllers/home.dart';
import 'package:app/controllers/location.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}

class DirectionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectionsController>(() => DirectionsController());
  }
}
