import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'data/repositories/user/user_repository.dart'; // Import UserRepository
import 'firebase_options.dart';

Future<void> main() async {
  /// Add Widgets Binding
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Local Storage
  await GetStorage.init();

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) {
    // Initialize both AuthenticationRepository and UserRepository
    Get.put(AuthenticationRepository());
    Get.put(UserRepository()); // Add this line
  });

  // Todo: Initialize Authentication

  runApp(MyApp());
}
