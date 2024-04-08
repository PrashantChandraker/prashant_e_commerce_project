import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/chips/choice_chip.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/product_title.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_function.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      // selected attribute pricing and Description
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // title , price , stock status

              Row(
                children: [
                  const TSectionHeading(
                    title: 'variation',
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price: ',
                            smallsize: true,
                          ),

                          // actual price
                          Text(
                            '₹ 950',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(
                            width: TSizes.spaceBtwItems / 1.5,
                          ),
                          const TProductPriceText(price: ' 700')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock: ',
                            smallsize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              // variation description
              const TProductTitleText(
                title:
                    'This is the description of product and can go up to maximum 4 lines',
                smallsize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Attributes

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colours', showactionbutton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
           Wrap(
            spacing: 8,
            children: [
               TChoiceChip(
              text: 'Green',
              selected: true,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Blue',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Red',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Yellow',
              selected: false,
              onSelected: (value) {},
            ),
            ],
           )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size',showactionbutton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
              TChoiceChip(
              text: ' 28',
              selected: true,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: '30',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: '32',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: '34',
              selected: false,
              onSelected: (value) {},
            ),
            ],)
          ],
        )
      ],
    );
  }
}
