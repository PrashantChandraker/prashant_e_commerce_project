import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/icons/t_circular_icons.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/home/home.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class FavrouiteScreen extends StatelessWidget {
  const FavrouiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        // backgroundColor: TColors.primary,
        giventitle: Text('WishList', style: Theme.of(context).textTheme.headlineMedium,),
        givenactions: [
          TCircularIcon(icon: Iconsax.add, 
          color: THelperFunctions.isDarkmode(context) ? TColors.white : TColors.black,
          onPressed: () => Get.to(const HomeScreen(),),),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TGridLayout(itemcount: 6, itemBuilder: (_, index) =>const TProductCArdVertical())
          ],
        ),
        ),
      ),
    );
  }
}