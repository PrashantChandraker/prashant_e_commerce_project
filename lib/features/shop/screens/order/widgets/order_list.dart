import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,

      separatorBuilder: (_, index) =>  const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, __) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  ROW 1---
            Row(
              children: [
                //  1 -- icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
      
                //  1 -- Status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '25 DEC 2023',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
      
                // 3 - icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
              ],
            ),
      const SizedBox(height: TSizes.spaceBtwItems,),
      
      // ROW -2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //  1 -- icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                  
                      //  1 -- Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium  ),
                            Text(
                              '[#080699]',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                  
                      ],
                  ),
                ),
      
      
                  Expanded(
                    child: Row(
                    children: [
                      //  1 -- icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                                  
                      //  1 -- Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium  ),
                            Text(
                               '06 JAN 2024',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                                  
                      ],
                                  ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
