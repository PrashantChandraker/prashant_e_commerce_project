import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(verifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepsitory.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: AssetImage(TImages.verifyemailLogo),
                width: THelperFunctions.screenWidth() * 0.8,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Title & subtitle

              Text(
                TTexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Elevated button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => controller.checkEmailVerificationStatus(),
                        ),
                    child: const Text(TTexts.continuee)),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(), child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
