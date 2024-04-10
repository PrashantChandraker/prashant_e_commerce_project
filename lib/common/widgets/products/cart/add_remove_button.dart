
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../icons/t_circular_icons.dart';

class TProductQuantityAddandRemoveButtons extends StatelessWidget {
  const TProductQuantityAddandRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkmode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkmode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.primary),
      ],
    );
  }
}
