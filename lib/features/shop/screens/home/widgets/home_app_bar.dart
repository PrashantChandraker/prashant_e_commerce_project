
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      giventitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      givenactions: const [
        TCartCounterIcon(
          
          iconcolor: TColors.white,
        ),
      ],
    );
  }
}