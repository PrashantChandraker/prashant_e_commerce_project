import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/features/authentication/controllers/login/login_controller.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/Password_configuration/forgot_password.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/signup/signup.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.LoginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              onFieldSubmitted: (val){
                FocusScope.of(context).requestFocus(controller.passwordFocus);
              },
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
                  
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            //password

            Obx(
              () => TextFormField(
                focusNode: controller.passwordFocus,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidepassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value =
                          !controller.hidepassword.value,
                      icon: Icon(controller.hidepassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remmember me
                Row(
                  children: [
                    Obx(
                      ()=> Checkbox(
                          value: controller.rememberme.value,
                          onChanged: (value) => controller.rememberme.value = !controller.rememberme.value),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                //forgot Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //signbutton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //Create account button

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const Signup_Screen()),
                  child: const Text(TTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
