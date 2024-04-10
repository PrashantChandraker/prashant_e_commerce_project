
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image.strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/t_rounded_images.dart';
import '../../texts/T_brand_title_text_with_verifiedIcon.dart';
import '../../texts/product_title.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        TRoundedImage(imageURL: TImages.nikelogo,
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundcolor: THelperFunctions.isDarkmode(context) ? TColors.darkGrey : TColors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
    
        // Title, price and size
    
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitleWithVerifiedIcon(title: 'Nike',),
            const Flexible(child: TProductTitleText(title: 'Blue Sports Shoes', maxLines: 1,)),  
    
              //Attributes
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Color ', style:Theme.of(context).textTheme.bodySmall, ),
                   TextSpan(text: 'Green ', style:Theme.of(context).textTheme.bodyLarge, ),
                    TextSpan(text: 'Size ', style:Theme.of(context).textTheme.bodySmall, ),
                     TextSpan(text: 'UK 08 ', style:Theme.of(context).textTheme.bodyLarge, ),
    
    
                ]
              ))
    
          ],
        )
      ],
    );
  }
}