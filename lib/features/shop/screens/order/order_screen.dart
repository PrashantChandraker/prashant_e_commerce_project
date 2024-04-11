import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/order/widgets/order_list.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TOrderScreen extends StatelessWidget {
  const TOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: TAppBar(
        giventitle: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall, ),
        showbackarrow: true,
      ),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

      // orders

      child: TOrderListItems(),
      ),
    );
  }
}