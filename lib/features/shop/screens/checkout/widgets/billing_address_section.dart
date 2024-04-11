import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAdressSection extends StatelessWidget {
  const TBillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TSectionHeading(title: 'Shipping Address', buttontitle:  'Change', onpressed: () {}, ),
           Text('Prashant Chandraker', style: Theme.of(context).textTheme.bodyLarge,),
 const SizedBox(height:2,),
            Row(
            children: [
              const Icon(Icons.phone, color: TColors.darkGrey, size: 16,),
               const SizedBox(width: TSizes.spaceBtwItems/2,),
               Text('8827530290', style: Theme.of(context).textTheme.bodyMedium,),
            ],
           ),
           const SizedBox(height: TSizes.spaceBtwItems/2,),
            Row(
            children: [
              const Icon(Icons.location_history, color: TColors.darkGrey, size: 16,),
               const SizedBox(width: TSizes.spaceBtwItems/2,),
               Text('Village Aundhi, Bhilai, chattisgarh', style: Theme.of(context).textTheme.bodyMedium,softWrap: true,),
            ],
           ),
      ],
    );
  }
}