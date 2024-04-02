import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:prashant_e_commerce_project/features/authentication/screens/signup/widgets/signup_Form.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';


class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), 
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        color: dark ? TColors.white : TColors.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //form

              const TSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
