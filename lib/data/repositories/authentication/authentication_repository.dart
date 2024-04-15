import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/signup/verify_email.dart';
import 'package:prashant_e_commerce_project/navigation.dart';
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
    //remove the native splash screen
    FlutterNativeSplash.remove();

    //redirect to appropriate screen
    screenRedirect();
  }

//function to show RElevant Screen

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      
      //local storage
      devicestorage.writeIfNull('IsFirstTime', true);

      //check if its fist time launching the app
      devicestorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginScreen()) //redirect to login screen if not the first time
          : Get.offAll(
              const OnBoardScreen()); //redirect to Onboarding screen if its the first time
    }
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

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again.';
    }
  }

//Email Authentication ---- forgot password




//logout  -- valid for any authentication
Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
      throw TFormatException();
      
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again.';
    }
  }

}
