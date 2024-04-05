import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/home_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {  
  const TPromoSlider({
    super.key, required this.promobanners,
  });

  final List<String> promobanners;

  @override
  Widget build(BuildContext context) {
    final myslidercontroller  = Get.put(HomeController(),);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.96,
            onPageChanged: (index , _) => myslidercontroller.UpdatePageIndicator(index)
          ),
          items: promobanners.map((url) => TRoundedImage(imageURL: url)).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < promobanners.length; i++)
                   TCircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backgroundcolor: myslidercontroller.CarouselControllerIndex.value ==i ? TColors.primary : TColors.darkGrey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
