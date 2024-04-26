import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/shimmer.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TCategoryshimmer extends StatelessWidget {
  const TCategoryshimmer({this.itemCount = 6, super.key});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemCount: itemCount,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                //Text
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          }),
    );
  }
}
