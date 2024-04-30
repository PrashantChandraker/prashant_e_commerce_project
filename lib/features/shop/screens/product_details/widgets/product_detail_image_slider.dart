import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:prashant_e_commerce_project/common/widgets/icons/t_circular_icons.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/images_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      givenchild: Container(
        color: dark ? TColors.darkerGrey : TColors.white,
        child: Stack(
          children: [
            //main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.enshowLargedImages(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, DownloadProgress) =>
                              CircularProgressIndicator(
                            value: DownloadProgress.progress,
                            color: TColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return TRoundedImage(
                        isNetworkImage: true,
                      width: 80,
                      border: Border.all(color:imageSelected? TColors.primary : Colors.transparent),
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundcolor: dark ? TColors.dark : TColors.white,
                      imageURL: images[index],
                      onpressed: () => controller.selectedProductImage.value  = images[index],
                    );
                    }
                  ),
                ),
              ),
            ),
            const TAppBar(
              showbackarrow: true,
              givenactions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
