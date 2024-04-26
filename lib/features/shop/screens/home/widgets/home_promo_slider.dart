import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/shimmer.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/banner_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/logging/logger.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    // required this.promobanners,
  });

  // final List<String> promobanners;

  @override
  Widget build(BuildContext context) {
    final myslidercontroller = Get.put(
      BannerController(),
    );
    return Obx(() {
      //loader
      if (myslidercontroller.isloading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      //no data found
      if (myslidercontroller.banners.isEmpty) {
        return const Center(child: Text('No data found'));
      } else {
        return Column(
          children: [
            CarouselSlider(

              items: myslidercontroller.banners
                  .map(
                    (banner) => TRoundedImage(
                      imageURL: banner.imageUrl,
                      isNetworkImage: true,
                      onpressed: () {
                        TLoggerHelper.error('message');
                        Get.toNamed(banner.targetScreen);
                      },
                    ),
                  ) .toList(),

              options: CarouselOptions(
                  viewportFraction: 0.96,
                  onPageChanged: (index, _) =>
                      myslidercontroller.UpdatePageIndicator(index)),
              
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < myslidercontroller.banners.length; i++)
                      TCircularContainer(
                        margin: const EdgeInsets.only(right: 10),
                        width: 20,
                        height: 4,
                        backgroundcolor:
                            myslidercontroller.carouselcurrentindex.value == i
                                ? TColors.primary
                                : TColors.darkGrey,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}








/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/category_shimmer.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/banner_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/home_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    // required this.promobanners,
  });

  // final List<String> promobanners;

  @override
  Widget build(BuildContext context) {
    final myslidercontroller = Get.put(
      HomeController(),
    );
    final bannerController = Get.put(BannerController());

    return Obx(() {
      if (bannerController.isloading.value) return const TCategoryshimmer();

      if (bannerController.featuredbanners.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.96,
                onPageChanged: (index, _) =>
                    myslidercontroller.UpdatePageIndicator(index)),
            items: bannerController.featuredbanners.map((bannerModel) {
              return Builder(
                builder: (BuildContext context) {
                 return TRoundedImage(isNetworkImage: true ,imageURL: bannerModel.image,);
                 
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i <  bannerController.featuredbanners.length; i++)
                    TCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 4,
                      backgroundcolor:
                          myslidercontroller.CarouselControllerIndex.value == i
                              ? TColors.primary
                              : TColors.darkGrey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

*/







