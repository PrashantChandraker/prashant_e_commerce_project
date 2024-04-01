import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard_PageIndicator extends StatelessWidget {
  const OnBoard_PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkmode(context);
    return Positioned(
      bottom: TDeviceutils.getBottomNavaigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 8),
      ),
    );
  }
}
