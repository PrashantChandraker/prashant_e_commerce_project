import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/onBoarding/onboarding.dart';

class AuthenticationRepsitory extends GetxController{
  static AuthenticationRepsitory get instance => Get.find();

  //variable
  final devicestorage = GetStorage();

  // called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();



  }


//function to show RElevant Screen
screenRedirect() async {


//local storage

if(kDebugMode){
  print('-------------storage--------');
  print(devicestorage.read('IsFirstTime'));
}



devicestorage.writeIfNull('IsFirstTime', true);
devicestorage.read('IsFirstTime') != true ? Get.offAll(()=> const LoginScreen()) : Get.offAll(OnBoardScreen()); 
}

// ----------------------Email and Password Signin----------------------------  //


// Email Authentication  ---- signin

// Email Authentication  ---Register

// Reauthenticate  ---- Reauthenticate user

//  EmailVerification -- Mail Verification
 
//Email Authentication ---- forgot password




}