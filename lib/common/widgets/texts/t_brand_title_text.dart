import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.color,
    this.textAlign = TextAlign.center,
    this.brandtextsizes = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandtextsizes;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,

        //check which brand sizes is required and set the style
        style: brandtextsizes == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandtextsizes == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                : brandtextsizes == TextSizes.medium
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: color)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: color));
  }
}
