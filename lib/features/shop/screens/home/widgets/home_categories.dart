
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/category_controller.dart';

import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    
    return Obx(
      () {
        if(categoryController.isloading.value) return const TCategoryshimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(
            child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
          );
        }
        return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TverticalCirculartextimage(
              image: category.image,
              title: category.name,
              ontap: ()=> Get.to(()=>  SubCategoriesScreen(category: category,))
            );
          },
        ),
      );
      } 
    );
  }
}
