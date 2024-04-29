import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/brands_showcase.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';

import '../../../models/product_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //brands
              TBrandShowCase(
                images: [TImages.shirt_1, TImages.nikepants, TImages.nikeshoe2],),
                 TBrandShowCase(
                images: [TImages.shirt_1, TImages.nikepants, TImages.nikeshoe2],),
              //products
        
              TSectionHeading(
                title: TTexts.mightlike,
              
                onpressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              // TGridLayout(itemcount: 8, itemBuilder: (_, index) => TProductCArdVertical(product: ProductModel.empty(),),),

              TGridLayout(
                      itemcount: controller.featuredProducts.length,
                      itemBuilder: (_,index) =>  TProductCArdVertical(product:  controller.featuredProducts[index]),
                    ),

               const SizedBox(height: TSizes.spaceBtwItems,),
            ],
          ),
        ),
      ],
    );
  }
}
