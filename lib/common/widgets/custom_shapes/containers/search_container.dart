
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.giventext,
    this.givenicon = Iconsax.search_normal,
     this.showbackground = true,
     this.showborder = true, this.ontap, this. padding= const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String giventext;
  final IconData? givenicon;
  final bool showbackground, showborder;
  final VoidCallback ? ontap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
       padding: padding,
        child: Container(
          width: TDeviceutils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              color: showbackground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : TColors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border:showborder ?  Border.all(color: Colors.grey) : null),
          child: Row(
            children: [
              Icon(
                givenicon,
                color: TColors.darkerGrey,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                giventext,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
