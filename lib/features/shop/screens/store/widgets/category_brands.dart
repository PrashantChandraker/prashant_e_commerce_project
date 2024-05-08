import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brands_showcase.dart';
import '../../../../../common/widgets/shimmers/box_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/image.strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';
import '../../../controllers/product/brand_controller.dart';
import '../../../models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  CategoryBrands({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle Loder,No Record,OR Error Message
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TBoxesShimmer(),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        //record found
        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];

              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {

                    // handle loader, no record, or error message
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , loader: loader);
                    if(widget!= null) return widget;

                    // record found
                    final products  = snapshot.data!;
                    return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            });
      },
    );
  }
}
