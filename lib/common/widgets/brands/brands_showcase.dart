
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/store/widgets/t_brand_card.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.xs),
      child: Column(
        children: [
          //brand with products count
          const TBrandcard(
            showBorder: false,
          ),
 const SizedBox(height: TSizes.spaceBtwItems,),
          // brand top 3 products images
          Row(
            children: 
              images.map((image) => BrandTopProductImage(image, context)).toList(),
            
          ),
        ],
      ),
    );
  }

  Widget BrandTopProductImage(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkmode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.xs),
        padding: const EdgeInsets.all(TSizes.xs),
        child: Image(image: AssetImage(image)),
      ),
    );
  }
}
