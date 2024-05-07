import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/t_brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/brand_controller.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        giventitle: Text('Brand'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            //heading
            children: [
              const TSectionHeading(title: 'Brands'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return  TBrandsShimmer(
                    itemCount: brandController.allBrands.length,
                  );
                }

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No data found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.red),
                    ),
                  );
                }

                return TGridLayout(
                    itemcount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return TBrandcard(
                        showBorder: true,
                        brand: brand,
                        ontap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
