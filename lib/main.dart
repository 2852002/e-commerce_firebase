import 'package:ecommerce_store/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart'; // Ensure this is imported only once

Future<void> main() async {
  // Ensure that WidgetsFlutterBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Preserve the splash screen until Firebase is initialized
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Initialize Firebase with the provided options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    // Put the AuthenticationRepository in the GetX dependency management
    Get.put(AuthenticationRepository());
  });

  // Run the app
  runApp(const App());
}
