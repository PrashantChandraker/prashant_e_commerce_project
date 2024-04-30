import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/T_brand_title_text_with_verifiedIcon.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/product_title.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/product_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/enums.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

import '../../../models/product_model.dart';

class TProductMetaDeta extends StatelessWidget {
  const TProductMetaDeta({super.key, required this.product});


 final  ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salepercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price and sale price
        Row(
          children: [
            //sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salepercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            //price

            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text(
              '₹ ${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
             TProductPriceText(
              price: controller.getProductPrice(product),
              islarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        //title
        const TProductTitleText(title: 'Brown Nike Sports track pants'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),


        // stock status
        Row(
          children: [
            const TProductTitleText(title: 'status'),
             const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'In stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // brands

       Row(
         children: [
          TCircularImage(
            width: 32,
            height: 32,
             overlaycolor: dark? TColors.white : TColors.black,
            image: TImages.nikesmalllogo),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
           const TBrandTitleWithVerifiedIcon(title: 'Nike', givenbrandtextsize: TextSizes.medium,),
         ],
       ),
       const SizedBox(height: TSizes.spaceBtwItems,)
      ],
    );
  }
}
