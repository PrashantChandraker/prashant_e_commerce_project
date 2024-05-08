
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/t_brand_card.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/shimmer.dart';
import 'package:prashant_e_commerce_project/features/shop/models/brand_model.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/brands/brand_products.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images, required this.brand,
  });

  final BrandModel brand;
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return  InkWell(

      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        padding: EdgeInsets.all(TSizes.xs),
        child: Column(
          children: [
            //brand with products count
             TBrandcard(
              showBorder: false, brand:brand,
            ),
       SizedBox(height: TSizes.spaceBtwItems,),
            // brand top 3 products images
            Row(
              children: 
                images.map((image) => BrandTopProductImage(image, context)).toList(),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget BrandTopProductImage(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkmode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.xs),
        padding: const EdgeInsets.all(TSizes.xs),
        child:CachedNetworkImage(fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, DownloadProgress) => const TShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        )
      ),
    );
  }
}
