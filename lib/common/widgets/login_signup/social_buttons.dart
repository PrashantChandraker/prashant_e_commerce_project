
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Image(
                height: TSizes.xl,
                width: TSizes.xl,
                image: AssetImage(TImages.google))),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
         Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Image(
                height: TSizes.xl,
                width: TSizes.xl,
                image: AssetImage(TImages.facebook))),
        ),
      ],
    );
  }
}

