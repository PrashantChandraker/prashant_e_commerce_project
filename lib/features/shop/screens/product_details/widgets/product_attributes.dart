import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/chips/choice_chip.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/product_title.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/variation_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/models/product_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_function.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkmode(context);
    return Obx(
    () =>  Column(
        children: [
          // selected attribute pricing and Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  // title , price , stock status
      
                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'variation',
                        showactionbutton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price: ',
                                smallsize: true,
                              ),
      
                              // actual price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                '₹ ${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
      
                              const SizedBox(
                                width: TSizes.spaceBtwItems / 1.5,
                              ),
      
                              //sale price
                               TProductPriceText(price: controller.getVariablePrice())
                            ],
                          ),
      
                          //stock
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock: ',
                                smallsize: true,
                              ),
                              Text(
                               controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // variation description
                   TProductTitleText(
                    title:controller.selectedVariation.value.description ?? '',
                    smallsize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
      
          // Attributes
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TSectionHeading(
                        title: attribute.name ?? '',
                        showactionbutton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      
                      Obx(
                        () => Wrap(
                           spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);


                                
                            return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                      
                                        if (selected && available) {
                                          controller.onAttributeSelected(product,
                                              attribute.name ?? '', attributeValue);
                                        }
                                      }
                                    : null);



                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
