import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/t_brand_card.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/brand_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/models/brand_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar:  TAppBar(
        giventitle: Text(brand.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //brand detail

            TBrandcard(showBorder: true, brand: brand,),
            const SizedBox(height: TSizes.spaceBtwSections,),


             FutureBuilder(
             future: controller.getBrandProducts(brandId:  brand.id),
             builder: (context, snapshot) {


              // handle loader , no record or error meesage

              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              if(widget != null) return widget;


                // record found!
                final brandProducts = snapshot.data!;
              return  TSortableProducts(products: brandProducts,);
             },
             
             
            ),
          ],
        ),
        ),
      ),
    );
  }
}
