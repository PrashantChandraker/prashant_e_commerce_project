
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../personalization/controllers/address_controller.dart';


class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressController =
        Get.find<AddressController>(); // Get the controller instance
    return Obx(() {
      // Wrap your widget with Obx and provide a callback
      final selectedAddress = addressController.selectedAddress.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: 'Shipping Address',
            buttontitle: 'Change',
            onpressed: () => addressController.selectNewAddressPopup(context),
          ),
          selectedAddress.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedAddress.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Text(
                          selectedAddress.phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Expanded(
                          child: Text(
                            '${selectedAddress.street}, ${selectedAddress.city}, ${selectedAddress.state}, ${selectedAddress.country}',
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Text(
                  'Select Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
        ],
      );
    });
  }
}