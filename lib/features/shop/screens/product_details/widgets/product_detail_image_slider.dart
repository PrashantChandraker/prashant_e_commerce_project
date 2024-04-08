
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:prashant_e_commerce_project/common/widgets/icons/t_circular_icons.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_rounded_images.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, 
    
  });



  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkmode(context);
    return TCurvedEdgeWidget(
      givenchild: Container(
        color: dark ? TColors.darkerGrey : TColors.white,
        child: Stack(
          children: [
            //main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                    const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.mobilelogo),
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
                  itemCount: 6,
                  itemBuilder: (_, index) => TRoundedImage(
                      width: 80,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundcolor: dark ? TColors.dark : TColors.white,
                      imageURL: TImages.nikepants),
                ),
              ),
            ),
           const TAppBar(
              showbackarrow: true,
              givenactions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
