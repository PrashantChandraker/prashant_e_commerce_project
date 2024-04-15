import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          //subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ 2500', style: Theme.of(context).textTheme.bodyMedium, )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),

          //shipping fees
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ 25', style: Theme.of(context).textTheme.labelLarge, )
            ],
          ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),

          //Tax fees
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ 5', style: Theme.of(context).textTheme.labelLarge, )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),

          //Order Total 
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ 5', style: Theme.of(context).textTheme.titleMedium, )
            ],
          ),
        ],
    );
  }
}