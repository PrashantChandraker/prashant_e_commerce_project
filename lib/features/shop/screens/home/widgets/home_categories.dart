
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';

import '../../sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TverticalCirculartextimage(
            image: TImages.mobilelogo,
            title: 'Mobiles',
            ontap: ()=> Get.to(()=> const SubCategoriesScreen())
          );
        },
      ),
    );
  }
}
