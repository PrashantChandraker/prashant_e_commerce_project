import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/styles/shadow_styles.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/icons/t_circular_icons.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/T_brand_title_text_with_verifiedIcon.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/product_title.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.horizontalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Row(
        children: [
          // thumbnail

          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            // backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageURL: TImages.nikeshoe2,
                    applyImageRadius: true,
                  ),
                ),

                // sale tag

                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Blue nike sports running shoe',
                        smallsize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // pRicing
                      const Flexible(child: TProductPriceText(price: '2500')),

                      // add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          height: TSizes.iconLg * 1.2,
                          width: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
