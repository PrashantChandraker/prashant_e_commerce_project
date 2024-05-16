import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/category_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/all_Products/all_products.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/store/widgets/category_brands.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/cloud_helper_function.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //brands
              CategoryBrands(category: category),
              //products



              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {

                    // helper function : handle loader , no record or error message

                    final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader:const TVerticalProductShimmer());
                    if(response != null) return response;

                    // record found
                    final products =snapshot.data!;


                    return   Column(
                  children: [
                    TSectionHeading(
                      title: 'You might like',
                      onpressed: () => Get.to(AllProducts(title: category.name,
                      futureMethod: controller.getCategoryProducts(categoryId: category.id,),
                      )),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TGridLayout(
                      itemcount: products.length,
                      itemBuilder: (_, index) =>
                          TProductCArdVertical(product: products[index]),
                    ),
                  ],
                );
                  },



              
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
