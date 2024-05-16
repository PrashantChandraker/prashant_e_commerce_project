
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image.strings.dart';
import '../../models/payment_method_model.dart';
import '../../screens/checkout/widgets/payment_tile.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PayementMethodModel> selectPaymentMethod =
      PayementMethodModel.emptty().obs;

  @override
  void onInit() {
    selectPaymentMethod.value =
        PayementMethodModel(image: TImages.cod, name: 'COD');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethods(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                        title: 'Select Payment Method',
                        showactionbutton: false),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Paytm', image: TImages.paytm)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Google Pay', image: TImages.gpay)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Credit Cards', image: TImages.creditcard)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Phone Pay', image: TImages.phonepay)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Apple Pay', image: TImages.applepay)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Cash on Delivery', image: TImages.cod)),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                  ],
                ),
              ),
            ));
  }
}