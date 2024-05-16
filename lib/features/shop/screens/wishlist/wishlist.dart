import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../common/widgets/icons/t_circular_icons.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/products/products_card/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../navigation.dart';
import '../../../../utils/constants/image.strings.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';
import '../../controllers/product/favourites_controller.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    final navigationcontroller = Get.put(NavigationController());

    //  final controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
            color: Colors.white,
          )
        ],
      ),
     body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        //product grid
        child: Obx(
          () => FutureBuilder(
            future: controller.favouriteProducts(),
            builder: (context, snapshot) {
              //Nothing Found widget
              final emptywidget = TAnimationLoaderWidget(
                text: 'oops! whishlist is empty',
                animation: TImages.empty,
                showAction: true,
                actionText: 'Lets\'s add some',
                onActionPressed: 
                () {
                  // print('click');
                  navigationcontroller.selectedIndex.value = (navigationcontroller.selectedIndex.value=0) ;
                
                }
              );

              const loader = TVerticalProductShimmer(
                itemCount: 6,
              );
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptywidget);
              if (widget != null) {
                return widget;
              }
              final products = snapshot.data!;
              return TGridLayout(
                itemcount: products.length,
                itemBuilder: (_, index) => TProductCArdVertical(
                  product: products[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}