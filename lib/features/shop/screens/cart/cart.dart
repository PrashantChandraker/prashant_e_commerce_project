import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/checkout.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          showbackarrow: true,
          giventitle: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => CheckoutScreen()), child: const Text('Checkout  ₹ 2500'),),
        ),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          // items in cart
          child: TCartItems(),
        ),);
  }
}
