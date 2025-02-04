import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/checkout_controller.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttontitle: 'Change',
          onpressed: () => controller.selectPaymentMethods(context),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                // backgroundColor: dark ? TColors.light : TColors.black,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(
                  image: AssetImage(
                    controller.selectPaymentMethod.value.image
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Text(
                controller.selectPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
