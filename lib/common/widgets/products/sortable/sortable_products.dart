
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/all_product_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../features/shop/models/product_model.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });


final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        //dropdown
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              value: controller.selectedSortOption.value,
          onChanged: (value) {
            //sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
    
        //products
    
        Obx(() =>  TGridLayout(itemcount: controller.products.length, itemBuilder: (_, index)=>  TProductCArdVertical(product: controller.products[index],)))
      ],
    );
  }
}
