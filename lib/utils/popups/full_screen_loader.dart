// a utility class for managing a full screen loading dialog
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/loaders/animation_loader.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TFullScreenLoader {
  // open a full screen laoding dialog with a given text and animation

  //parameters
  // -text: text to be displayed in the laoduing dialog
  // - animation: animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // use get.overlaycontext for overlay dialogs
      barrierDismissible:
          false, // the dialog cant be dissmissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // disable poping with the back button
        child: Container(
          color: THelperFunctions.isDarkmode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ), // adjust the sapcing as needed
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }
  // stop the current open dialog loading
  //this mthod doest return anything

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();   // close the dialog using the navigator
  } 
}
