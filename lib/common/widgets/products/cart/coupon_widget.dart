
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          right: TSizes.sm,
          left: TSizes.md),
      child: Row(
        children: [
    
          //textfeild
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  ),
                  
            ),
          ),
    
          //button
          SizedBox(
            width: 90,
            child: ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: dark? TColors.white.withOpacity(0.5) :  TColors.black.withOpacity(0.5),
              backgroundColor:   TColors.grey.withOpacity(0.5),
              side: BorderSide(color: TColors.black.withOpacity(0.5),),
            ), child: const Text('Apply'),
            
            ),),
        ],
      ),
    );
  }
}