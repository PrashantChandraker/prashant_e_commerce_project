import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/t_circular_icons.dart';


class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () =>  TCircularIcon(
        icon: controller.isFavourite(productId)? Iconsax.heart5:Iconsax.heart,
        color: controller.isFavourite(productId)? TColors.error:Colors.black,
         onPressed: () => controller.toggleFavourite(productId),
        ));
   
  }
}