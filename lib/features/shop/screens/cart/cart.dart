import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/loaders/animation_loader.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/checkout.dart';
import 'package:prashant_e_commerce_project/navigation.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      
      body: Obx(
        () {
          // nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is empty',
            animation: TImages.empty,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                // items in cart
                child: TCartItems(),
              ),
            );
          }
        },
      ),

      // checkout button
      bottomNavigationBar:controller.cartItems.isEmpty
      ? const SizedBox()
       : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child:  Obx(()=>  Text('Checkout \₹${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
