import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/tab_bar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/category_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/brands/all_brands.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/store/widgets/category_tab.dart.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/t_brand_card.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/constants/text_strings.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          giventitle: Text(TTexts.store,
              style: Theme.of(context).textTheme.headlineMedium),
          givenactions: [
            TCartCounterIcon(
                iconcolor: THelperFunctions.isDarkmode(context)
                    ? TColors.white
                    : TColors.black,
                ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkmode(context)
                      ? TColors.black
                      : TColors.lightGrey,
                  expandedHeight: 420,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // search bar
                        TSearchContainer(
                          giventext: TTexts.homeAppbarTitle,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Brands

                        TSectionHeading(
                          title: 'Features Brands',
                          onpressed: () => Get.to(()=>const AllBrandScreen()),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),
                        TGridLayout(
                          mainAxisExtent: 80,
                          itemcount: 4,
                          itemBuilder: (_, index) {
                            return const TBrandcard(
                              showBorder: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  //TABS tab bar
                  bottom:  TTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                  
                  ),)
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => TCategoryTab(category: category,)).toList(),
          ),
        ),
      ),
    );
  }
}
