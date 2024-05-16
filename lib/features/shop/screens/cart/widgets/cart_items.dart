import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/add_remove_button.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/cart_item.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_price_text.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showaddremoveButtons = true});

  final bool showaddremoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              //cart item
               TCartItem(cartItem: item,),
              if (showaddremoveButtons)
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

              //add remove button row with total price
              if (showaddremoveButtons)
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // extra space
                        SizedBox(
                          width: 50,
                        ),
                        //add remove Buttons
                        TProductQuantityAddandRemoveButtons(quantity: item.quantity,
                        add: () => cartController.addOneToCart(item),
                        remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TProductPriceText(price: (item.price * item.quantity). toStringAsFixed(1))
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
