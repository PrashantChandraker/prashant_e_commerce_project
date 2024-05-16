import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/order_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image.strings.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';
import '../../../../../utils/helpers/helper_function.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkmode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          //nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No order Yet!',
            animation: TImages.empty,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //helper function :handle loader ,no record ,or error messgae
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //congratulations record found
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_,__) => const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSizes.md),
                    backgroundColor: THelperFunctions.isDarkmode(context)
                        ? TColors.dark
                        : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //row1
                        Row(
                          children: [
                            //1. icon
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            //2. status and date
                            Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: TColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(order.formattedOrderdate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ]),
                            ),
                            //3. icon
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_34,
                                  size: TSizes.iconSm,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        //row2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.ship),
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),
                                  //2. status and date
                                  Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Order',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.id,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),
                                  //2. status and date
                                  Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Shipping Date',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.formattedDeliveryDate,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
                return null;
              });
        });
  }
}