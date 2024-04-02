import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers/onBoarding/onboarding_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class OnBoarding_nextButton extends StatelessWidget {
  const OnBoarding_nextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceutils.getBottomNavaigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            backgroundColor: dark ? TColors.secondary : Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: dark ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
