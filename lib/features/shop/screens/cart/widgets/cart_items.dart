import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/add_remove_button.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/cart_item.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showaddremoveButtons = true});


final bool showaddremoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) =>  Column(
            children: [
              //caert item
              const TCartItem(),
             if(showaddremoveButtons) const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //add remove button row with total price
              if(showaddremoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // extra space
                      SizedBox(
                        width: 50,
                      ),
                      //add remove Buttons
                      TProductQuantityAddandRemoveButtons(),
                    ],
                  ),
                  TProductPriceText(price: '2500')
                ],
              )
            ],
          ),
        );
  }
}