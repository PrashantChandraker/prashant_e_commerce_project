import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return  Column(
        children: [
          //subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ $subTotal', style: Theme.of(context).textTheme.bodyMedium, )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),

          //shipping fees
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ ${TPricingCalculator.calculateShippingCost(subTotal, 'IND')}', style: Theme.of(context).textTheme.labelLarge, )
            ],
          ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),

          //Tax fees
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ ${TPricingCalculator.calculateTax(subTotal, 'IND')}', style: Theme.of(context).textTheme.labelLarge, )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),

          //Order Total 
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ ${TPricingCalculator.calculateTotalPrice(subTotal, 'IND')}', style: Theme.of(context).textTheme.titleMedium, )
            ],
          ),
        ],
    );
  }
}