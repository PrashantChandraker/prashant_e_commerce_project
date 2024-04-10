import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_details/widgets/Tbottom_add_to_cart.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_reviews/product_review.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            const TProductImageSlider(),
            //product details
            Padding(
              padding: const EdgeInsets.only(
                  bottom: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and share
                  const TRatingandShare(),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),

                  /// price title stock and brand
                  const TProductMetaDeta(),

                  /// attributes
                  const ProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Description
                  const TSectionHeading(
                    title: 'Description',
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText('This is a product description for the brand nike shoes , there are more things that cam be added into it but for now i only added this in the read more text widget...',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',

                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                    const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                const Divider(),
                const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)', showactionbutton: false,),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  )
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
