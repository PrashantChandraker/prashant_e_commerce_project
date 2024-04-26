import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/repositories/user/user_repositoy.dart';
import '../../../../../network_manager.dart';
import '../../../../../utils/constants/image.strings.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../controllers/user_controller.dart';
import '../profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information.....', TImages.loading);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
     
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
       
        TFullScreenLoader.stopLoading();
        return;
      }
      //update usrs first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
 
      //remove loader
       TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');

      //move to previos screen
      Get.off(() => const ProfileScreen());
    } 
    catch (e) {
      print('hiiii');
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}