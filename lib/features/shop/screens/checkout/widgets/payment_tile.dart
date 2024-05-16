import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controllers/product/checkout_controller.dart';
import '../../../models/payment_method_model.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentmethod});

  final PayementMethodModel paymentmethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectPaymentMethod.value = paymentmethod;
        Get.back();
      },
      leading: TRoundedContainer(
          width: 60,
          height: 40,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkmode(context)
              ? TColors.light
              : TColors.white,
          child: Image(
              image: AssetImage(paymentmethod.image), fit: BoxFit.contain)),
      title: Text(paymentmethod.name),
      trailing: const Icon(Iconsax.arrow_right),
    );
  }
}