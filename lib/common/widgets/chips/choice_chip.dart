import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/variation_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkmode(context);
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor
          ? const SizedBox()
          : Text(
              text,
              style: TextStyle(color: dark ? TColors.white : TColors.black),
            ),

      selected:  selected,
      
      onSelected:   onSelected,



      labelStyle: const TextStyle(color: true ? TColors.white : null),
      avatar: isColor
          ? TCircularContainer(
              width: 50,
              height: 50,
              backgroundcolor: THelperFunctions.getColor(text)!)
          : null,

      labelPadding: isColor ? const EdgeInsets.all(0) : null,

      // making icon in the centre
      padding: isColor ? const EdgeInsets.all(0) : null,

      backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      shape: isColor ? const CircleBorder() : null,
    );
  }
}
