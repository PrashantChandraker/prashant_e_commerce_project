import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedaddress});

  final bool selectedaddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      // height: double.maxFinite,
      showBorder: true,
      backgroundColor: selectedaddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedaddress
          ? Colors.green
          : dark
              ? TColors.darkGrey
              : TColors.black,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedaddress ? Iconsax.tick_circle5 : null,
              color: selectedaddress
                  ? dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.5)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Prashant chandraker',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
              ),
               const SizedBox(height: TSizes.sm/2,),
               Text('+91 8827530290', maxLines: 1, overflow: TextOverflow.ellipsis,),
               const SizedBox(height: TSizes.sm/2,),
               const Text(' SR Nagar, Hyderabad, 500038, Telangana, \n India',),
            ],
          )
        ],
      ),
    );
  }
}
