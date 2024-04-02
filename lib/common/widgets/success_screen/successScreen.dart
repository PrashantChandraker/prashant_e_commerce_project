import 'package:flutter/material.dart';

import 'package:prashant_e_commerce_project/common/styles/spacing_styles.dart';

import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.givenimage,
      required this.title,
      required this.subtitle,
       this.onpressedbutton});

  final String givenimage, title, subtitle;
  final VoidCallback? onpressedbutton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Image
              Image(
                image: AssetImage(givenimage),
                width: THelperFunctions.screenWidth() * 0.8,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Title and SUbtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onpressedbutton,
                    child: const Text(TTexts.continuee)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
