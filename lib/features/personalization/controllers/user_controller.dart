import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prashant_e_commerce_project/data/repositories/user/user_model.dart';
import 'package:prashant_e_commerce_project/data/repositories/user/user_repositoy.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/logging/logger.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidepassword = false.obs;
  final imageuploading = false.obs;
  final verifypassword = TextEditingController();
  final verifyemail = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user record  from any  Registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //refresh user record.... First update Rx user and then check if user user data is already stored. if not store new data
      await fetchUserRecord();

      //if no record already stored...
      if (userCredential != null) {
        // convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // map data
        final User = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
        // save user data
        await userRepository.saveUserRecord(User);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data Not Saved',
        message:
            'Something went wrong while saving your information. you can resave your data in your profile',
      );
    }
  }

// delete account warning poppup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are You sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () {
            TLoggerHelper.error('message');
             deleteUserAccount();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("cancel")));
  }

  //Delete user Account

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loading);

      //First re-Authenticate User
      final auth = AuthenticationRepsitory.instance;
      final provider =
          auth.authuser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'OH snap', message: e.toString());
    }
  }

  //- - RE-Authenticate before deleting

  Future<void> reAuthenticateEmailAndpasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loading);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepsitory.instance.reAuthenticateEmailAndpassword(
          verifyemail.text.trim(), verifypassword.text.trim());
      await AuthenticationRepsitory.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
    }
  }

  //  reAuthenticateEmailAndpasswordUser() {}





  /// upload profile image
  UploadprofilePicture() async {
    try {
  final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512);
  if (image != null) {

    imageuploading.value = true;
    //upload image
    final imageUrl =
      await userRepository.uploadImage('users/Images/profile/', image);
  
    //update user image record
    Map<String, dynamic> json = {'ProfilePicture': imageUrl};
    await userRepository.updateSingleField(json);
  
    user.value.profilePicture = imageUrl;
    user.refresh();
    TLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile picture is uploaded',);
  }
}   catch (e) {
  TLoaders.errorSnackBar(title: 'Oh Dear', message: 'Something went wrong : $e');
}finally{
  imageuploading.value = false;
}
    
  }
}
