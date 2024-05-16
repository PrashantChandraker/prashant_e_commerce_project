
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/features/shop/models/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/t_rounded_images.dart';
import '../../texts/T_brand_title_text_with_verifiedIcon.dart';
import '../../texts/product_title.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });


final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        TRoundedImage(imageURL: cartItem.image ?? '',
        width: 60,
        height: 60,
        isNetworkImage: true,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundcolor: THelperFunctions.isDarkmode(context) ? TColors.darkGrey : TColors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
    
        // Title, price and size
    
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? '',),
               Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1,)),  
              
                //Attributes
               //attritube
              Text.rich(TextSpan(
                children: (cartItem.selectedVariation ?? {})
                    .entries
                    .map(
                      (e) => TextSpan(children: [
                        TextSpan(
                            text: '${e.key}',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: '${e.key}',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ]),
                    )
                    .toList(),
              ))
              
            ],
          ),
        )
      ],
    );
  }
}