import 'package:flutter/material.dart';

import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividertext,
  });
  final String dividertext;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.dark : TColors.grey,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividertext,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TColors.dark : TColors.grey,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
