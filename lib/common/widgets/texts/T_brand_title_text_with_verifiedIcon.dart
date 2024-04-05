import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/t_brand_title_text.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/enums.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
     this.maxlines = 1,
    this.textcolor,
    this.iconcolor = TColors.primary,
    this.textAlign = TextAlign.center,
     this.givenbrandtextsize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;
  final TextSizes givenbrandtextsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: TBrandTitleText(
          title:title,
          color:textcolor,
          maxlines: maxlines,
          textAlign: textAlign,
          brandtextsizes: givenbrandtextsize,
        ),),

        const SizedBox(width: TSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
