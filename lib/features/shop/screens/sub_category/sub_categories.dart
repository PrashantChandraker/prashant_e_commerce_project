import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/category_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/all_Products/all_products.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/cloud_helper_function.dart';

import '../../../../common/widgets/shimmers/horizonatl_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        titlee: Text(category.name),
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

              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    // handle loader no record or error message
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // record found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];

                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                // handle loader no record or error message
                                final widget =
                                    TCloudHelperFunctions.checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;

                                // congratulations!!! record found
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    // heading
                                    TSectionHeading(
                                      title: subCategory.name,
                                      onpressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                  ),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems / 2,
                                    ),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          width: TSizes.spaceBtwItems,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                             ProductCardHorizontal(product: products[index]),
                                      ),
                                    ),
                                    const SizedBox(height: TSizes.spaceBtwSections,)
                                  ],
                                );
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
