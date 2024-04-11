import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prashant_e_commerce_project/app.dart';
import 'package:prashant_e_commerce_project/firebase_options.dart';

import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  //done : add widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //  GetX local storage
  await GetStorage.init();

  //todo : init payment methods
  // await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //todo : initialize firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(
      AuthenticationRepsitory(),
    ),
  );
  //todo : initialize authentication
  runApp(const App());
}
