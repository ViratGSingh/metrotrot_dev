import 'package:app/bindings.dart';
import 'package:app/controllers/home.dart';
import 'package:app/firebase_options.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/location.dart';
import 'package:app/pages/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:wiredash/wiredash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Check for update when the home screen is first displayed
    //checkForUpdate();
  }

  // Method to check for update
  void checkForUpdate() async {
    // Check for update
    var updateAvailableResult = await InAppUpdate.checkForUpdate();
    if (updateAvailableResult.updateAvailability ==
        UpdateAvailability.updateAvailable) {
      // If an update is available, initiate the update process
      InAppUpdate.performImmediateUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'metrotrot-arcxpzu',
      secret: 'I2U5sQGZWY7f6fGd8CJNOHBRwOwIWiAj',
      child: GetMaterialApp(
        title: 'MetroTrot',
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        home: HomePage(),
      ),
    );
  }
}
