import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/login_signup/form_divider.dart';
import 'package:prashant_e_commerce_project/common/widgets/login_signup/social_buttons.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers/signup/signup_controller.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';

import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupformKey,
      child: Column(
        children: [

          //First and last name
          Row(
            children: [

              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) => TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,  //firstname
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),

              Expanded(
                child: TextFormField(
                   controller: controller.lastname,
                   
                  validator: (value) => TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,  //lastname
                    
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          //username
          TextFormField(
             controller: controller.username,
             
                  validator: (value) => TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //email
          TextFormField(
             controller: controller.email,
             
                  validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //phone number
          TextFormField(
             controller: controller.phonenumber,
             
                  validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Password
          Obx(
           () => TextFormField(
               controller: controller.password,
               
                    validator: (value) => TValidator.validatePassword( value),
              expands: false,
              obscureText: controller.hidepassword.value,
              decoration:  InputDecoration(
                labelText: TTexts.password,
                prefixIcon:const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: ()=>controller.hidepassword.value = !controller.hidepassword.value, 
                icon: Icon(controller.hidepassword.value ? Iconsax.eye_slash :  Iconsax.eye),)
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Terms and  condition checkbox
          const TTerms_and_conditions_checkbox(),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          // signUp Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //Divider

          TFormDivider(dividertext: TTexts.orSignUpWith.capitalize!),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          // Social buttons

          const SocialButtons(),
        ],
      ),
    );
  }
}
