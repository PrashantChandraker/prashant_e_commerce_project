import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // variables

  RxString selectedProductImage = ''.obs;

  // get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    // use set to add unique images only
    Set<String> images = {};

    // load thumbnai image
    images.add(product.thumbnail);

    // asign thumnai as selected image
    selectedProductImage.value = product.thumbnail;

    // get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // get all images from the product variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // show image popup
  void enshowLargedImages(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
            ),
          Image.network(image),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('Close')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
