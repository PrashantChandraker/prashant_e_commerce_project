import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/success_screen/successScreen.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

class verifyEmailController extends GetxController {
  static verifyEmailController get instance => Get.find();

  //send email where whenever verifyscreen appears and set  timer for auto redirect

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link

  sendEmailVerification() async {
    try {
      await AuthenticationRepsitory.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent!',
          message: 'Please check your inbox and verify Email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Dear!', message: e.toString());
    }
  }

  // timer to aautomatically redirect email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();

        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();

          Get.off(
            () => SuccessScreen(
              givenimage: TImages.successlogo,
              title: TTexts.accountCreatedTitle,
              subtitle: TTexts.accountCreatedSubtitle,
              onpressedbutton: () =>
                  AuthenticationRepsitory.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

// manully check if email verified

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          givenimage: TImages.successlogo,
          title: TTexts.accountCreatedTitle,
          subtitle: TTexts.accountCreatedSubtitle,
          onpressedbutton: () =>
              AuthenticationRepsitory.instance.screenRedirect(),
        ),
      );
    }
  }
}
