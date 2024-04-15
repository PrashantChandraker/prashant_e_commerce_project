
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/data/repositories/user/user_model.dart';
import 'package:prashant_e_commerce_project/data/repositories/user/user_repositoy.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/signup/verify_email.dart';
import 'package:prashant_e_commerce_project/network_manager.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/popups/full_screen_loader.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables

  final hidepassword = true.obs;

  final hidePrivacyPolicy = true.obs;
  final email =
      TextEditingController(); // conntroller fir inputs like email, lastname etc.
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformKey =
      GlobalKey<FormState>(); // form key for validaation
  // signup

  void signup() async {
    try {
      // start loading

      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.loading);

      // check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) 
      
      {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupformKey.currentState!.validate()) 
      {
        TFullScreenLoader.stopLoading();
        return;
      }
      

      //privacy policy

      if (!hidePrivacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message:
                'In order to create account, you must have to read and accept the privacy policy and Terms of use.');
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the firebase Authentication & save user data in the firebase

      final UserCredential = await AuthenticationRepsitory.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase

      final newuser = UserModel(
          id: UserCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim() ,
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phonenumber.text.trim(),
          profilePicture: '');

          final givenuserRepository = Get.put(UserRepository());

         await givenuserRepository.saveUserRecord(newuser);

      // show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created');

      // move to verify email screen

        Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some genric error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
