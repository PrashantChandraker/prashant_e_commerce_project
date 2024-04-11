import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttontitle:  'Change', onpressed: () {}, ),
        SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        TRoundedContainer(
                          width: 60,
                          height: 35,
                          // backgroundColor: dark ? TColors.light : TColors.black,
                          padding:const EdgeInsets.all(TSizes.sm),
                          child:  Image(image: AssetImage(TImages.paypal, ),fit: BoxFit.contain,),
                        ),
                         SizedBox(
                      height: TSizes.spaceBtwItems /2,
                    ),
                    Text('PayPal', style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    ),
      ],
    );
  }
}