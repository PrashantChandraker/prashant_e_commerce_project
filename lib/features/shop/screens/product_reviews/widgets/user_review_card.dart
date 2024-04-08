import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/ratings/rating_indicator.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.demouser),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Prashant chandraker',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        //reviews
        Row(
          children: [
            const TRatingbarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('6 JAN 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate nad make purchase seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'show more',
          trimExpandedText: ' show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //company reviews

        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('P&C', style: Theme.of(context).textTheme.titleMedium),
                    Text('8 JULY 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate nad make purchase seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'show more',
                  trimExpandedText: ' show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
