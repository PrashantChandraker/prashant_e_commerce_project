import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/coupon_widget.dart';
import 'package:prashant_e_commerce_project/common/widgets/success_screen/successScreen.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_amount_Section.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:prashant_e_commerce_project/navigation.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

import '../../../../utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        giventitle: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          // items in cart
          child: Column(
            children: [
              // items in cart
              const TCartItems(
                showaddremoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // coupon textfeild
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //Divider

                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //payment methods

                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingPaymentSection(),

                    //address
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingAdressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                givenimage: TImages.successlogo,
                title: 'Payment Successfull',
                subtitle: 'Your item will be shipped soon... ',
                onpressedbutton: () => Get.offAll(() => const NavigationMenu(),),
              )),
          child: const Text('Procced to pay -   ₹ 2500'),
        ),
      ),
    );
  }
}
