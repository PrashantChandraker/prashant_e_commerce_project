

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens.onboarding/widgets/OnBoarding_skipButton.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens.onboarding/widgets/onBoarding_nextButton.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens.onboarding/widgets/onBoarding_page.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens.onboarding/widgets/onBoarding_pageindicator.dart';

import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';

import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scroolable pages
          PageView(
            controller: controller.pageController,
            onPageChanged:controller.updatePageIndicator ,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingtitle1,
                subtitle: TTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingtitle2,
                subtitle: TTexts.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingtitle3,
                subtitle: TTexts.onBoardingSubtitle3,
              )
            ],
          ),

          ///Skip button
          const OnBoardingSkipButton(),

          ///Dot navigation smoothpageindicator
          const OnBoard_PageIndicator(),

          /// circular button
          const OnBoarding_nextButton()
        ],
      ),
    );
  }
}

