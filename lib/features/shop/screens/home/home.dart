import 'package:flutter/material.dart';

import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/home/widgets/home_categories.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHEaderContainer(
              thechild: Column(
                children: [
                  //Appbar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //Searchbar
                  TSearchContainer(
                    giventext: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //Categories

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //categroies heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showactionbutton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        // categories list view horizontal
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                ],
              ),
            ),

            // BODY

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Promo slider

                  TPromoSlider(
                    promobanners: [
                      TImages.nikelogo,
                      TImages.nikelogo2,
                      TImages.nikelogo3,
                      TImages.tshirtBanner
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                   TSectionHeading(
                    title: 'Popular Products',
                    showactionbutton: true,
                    giventextcolor: THelperFunctions.isDarkmode(context) ? TColors.white : TColors.dark,
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //popular products
                  TGridLayout(
                    itemcount: 6,
                    itemBuilder: (index, _) => const TProductCArdVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
