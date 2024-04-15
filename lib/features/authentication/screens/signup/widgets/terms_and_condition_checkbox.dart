// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers/signup/signup_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TTerms_and_conditions_checkbox extends StatelessWidget {
  const TTerms_and_conditions_checkbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkmode(context);
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 24,
          child: Obx(
            () => Checkbox(
                value: controller.hidePrivacyPolicy.value,
                onChanged: (value) => controller.hidePrivacyPolicy.value =
                    !controller.hidePrivacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    ),
              ),
              TextSpan(
                  text: ' ${TTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
