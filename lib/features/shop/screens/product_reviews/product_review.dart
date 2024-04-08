
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/ratings/rating_indicator.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_reviews/widgets/over_all_product_rating.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      //appbar

        appBar: TAppBar(giventitle: Text('Reviews and Ratings'),showbackarrow: true, centerTitle: true,),

        //body

        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings and reviews are verified and are from people who use the same type of device that you see'),
              SizedBox(height: TSizes.spaceBtwItems,),


              //overall product ratings
              OverAllProductRating(),
              TRatingbarIndicator(rating: 3.8,),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),



              // USer reviews list
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),


            ],
          ),
          ),
          
        ),
    );
  }
}


