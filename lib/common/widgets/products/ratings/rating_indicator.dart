import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class TRatingbarIndicator extends StatelessWidget {
  const TRatingbarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.darkGrey,
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: TColors.primary,));
  }
}