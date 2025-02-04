import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/data/repositories/address/address_model.dart';
import 'package:prashant_e_commerce_project/features/personalization/controllers/address_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap,});





final AddressModel address;
final VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {

    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkmode(context);
    return Obx(

     (){
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return  InkWell(
        onTap: onTap,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          width: double.infinity,
          // height: double.maxFinite,
          showBorder: true,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.green
              : dark
                  ? TColors.darkGrey
                  : TColors.black,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark.withOpacity(0.5)
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                   const SizedBox(height: TSizes.sm/2,),
                    Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                   const SizedBox(height: TSizes.sm/2,),
                    Text(address.toString(),),
                ],
              )
            ],
          ),
        ),
      );

     }
    );
  }
}
