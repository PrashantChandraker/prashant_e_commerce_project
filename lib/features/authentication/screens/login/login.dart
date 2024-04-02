import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:prashant_e_commerce_project/common/styles/spacing_styles.dart';
import 'package:prashant_e_commerce_project/common/widgets/login_signup/form_divider.dart';
import 'package:prashant_e_commerce_project/common/widgets/login_signup/social_buttons.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/widgets/login_form.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/widgets/login_header.dart';

import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo title & subtitle
              const TLoginHeader(),

              // form
              const TLoginForm(),
              //divider
              TFormDivider(
                dividertext: TTexts.orSignInwith.capitalize!,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
