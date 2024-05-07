
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/T_brand_title_text_with_verifiedIcon.dart';
import 'package:prashant_e_commerce_project/features/shop/models/brand_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/enums.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TBrandcard extends StatelessWidget {
  const TBrandcard({
    super.key, required this.showBorder, this.ontap, required this.brand,
  });


final BrandModel brand;
final bool showBorder;
final void Function ()? ontap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        borderColor: THelperFunctions.isDarkmode(context)
            ? TColors.lightGrey
            : TColors.darkGrey,
        child: Row(
          children: [
            // iCON
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                // overlaycolor:
                //     THelperFunctions.isDarkmode(context)
                //         ? TColors.white
                //         : TColors.black,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
    
            //text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                   TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    givenbrandtextsize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
