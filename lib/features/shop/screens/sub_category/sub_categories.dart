import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        giventitle: Text('Sport Shirts'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              TRoundedImage(
                  width: double.infinity,
                  height: null,
                  applyImageRadius: true,
                  imageURL: TImages.tshirtBanner),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // sub categories

              Column(
                children: [
                  // heading
                  TSectionHeading(
                    title: 'Sports Shirts',
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
