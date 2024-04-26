import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/Password_configuration/reset_password.dart';
import 'package:prashant_e_commerce_project/network_manager.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/popups/full_screen_loader.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordFormKey = GlobalKey<FormState>();


  //send reset password email
  sendPasswordResetEmail() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loading);
           // check internet connectivity
      final isconnected = await NetworkManager.instance.isConnected();
      if(!isconnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form validation
      if(!forgetpasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      // send email to reset password
      await AuthenticationRepsitory.instance.sendPasswordResetEmail(email.text.trim());
      //remove loader
      TFullScreenLoader.stopLoading();

      //show success screen
        TLoaders.errorSnackBar(title: 'Email sent', message: 'Email Link sent to reset your password'.tr);

        //redirect
      Get.to(()=> RestPasswordScreen(email: email.text.trim(),));

    }catch(e){
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }




  resendPasswordResetEmail(String email)async{
   try{
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loading);
        // check internet connectivity
      final isconnected = await NetworkManager.instance.isConnected();
      if(!isconnected){
        TFullScreenLoader.stopLoading();
        return;
      }
    
      // send email to reset password
      await AuthenticationRepsitory.instance.sendPasswordResetEmail(email);
      //remove loader
      TFullScreenLoader.stopLoading();

      //show success screen
        TLoaders.errorSnackBar(title: 'Email sent', message: 'Email Link sent to reset your password'.tr);


    }catch(e){
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}