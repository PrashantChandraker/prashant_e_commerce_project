// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:prashant_e_commerce_project/network_manager.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/popups/full_screen_loader.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

class LoginController extends GetxController {
  //variables

  final rememberme = false.obs;
  final hidepassword = true.obs;
  final localstorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordFocus = FocusNode();

  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localstorage.read('Remember_me_email') ?? '';
    password.text = localstorage.read('Remember_me_password') ?? '';
    super.onInit();
  }

  //email and password signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loading);

      //check internet connectivity

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!LoginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //save data if remmember is selected

      if (rememberme.value) {
        localstorage.write('Remember_me_email', email.text.trim());
        localstorage.write('Remember_me_password', password.text.trim());
      }
      //loginuser using email and password authentication

      final UserCredential = await AuthenticationRepsitory.instance
          .LoginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepsitory.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Dear!', message: e.toString());
    }
  }





// google signin authentication

  Future<void> googleSignin() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
// googgle authentication
      final UserCredential =
          await AuthenticationRepsitory.instance.signInWithGoogle();
          

// save user record
      await userController.saveUserRecord(UserCredential);

//remove loader
      TFullScreenLoader.stopLoading();

//Redirect
      AuthenticationRepsitory.instance.screenRedirect();
    } catch (e) {
//remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Dear', message: e.toString());
    }
  }
}
