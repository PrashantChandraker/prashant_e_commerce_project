import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/cart.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,  this.iconcolor, this.counterBgColor, this.counterTextColor, 
  });


final Color? iconcolor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {

    // Get instance of the cart controller
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(()=> const CartScreen(),),
          icon:  Icon(
            Iconsax.shopping_cart,
            color:iconcolor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: TColors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItem.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(
                          color: TColors.white,
                          fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}