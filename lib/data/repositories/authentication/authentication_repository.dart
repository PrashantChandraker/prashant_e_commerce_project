import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/firebase_auth_exception.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/firebase_exception.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/format_exception.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/platform_exception.dart';

class AuthenticationRepsitory extends GetxController {
  static AuthenticationRepsitory get instance => Get.find();

  //variable
  final devicestorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

//function to show RElevant Screen
  screenRedirect() async {
//local storage

    if (kDebugMode) {
      print('-------------storage--------');
      print(devicestorage.read('IsFirstTime'));
    }

    devicestorage.writeIfNull('IsFirstTime', true);
    devicestorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(OnBoardScreen());
  }

// ----------------------Email and Password Signin----------------------------  //

// Email Authentication  ---- signin

// Email Authentication  ---Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong. please try again';
    }
  }

// Reauthenticate  ---- Reauthenticate user

//  EmailVerification -- Mail Verification

//Email Authentication ---- forgot password
}
