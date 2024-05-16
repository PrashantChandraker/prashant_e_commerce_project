import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/coupon_widget.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_amount_Section.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';
import 'package:prashant_e_commerce_project/utils/helpers/pricing_calculator.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'IND');

    final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
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
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // checkout button
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal> 0 ? 
          () => orderController.processOrder(totalAmount) 
           : ()=> TLoaders.warningSnackBar(title: 'Empty cart',
           message: 'Add items in the cart in order to proceed'
           ),
          child: Text(
              'Procced to pay - ₹ ${TPricingCalculator.calculateTotalPrice(subTotal, 'IND')}'),
        ),
      ),
    );
  }
}
