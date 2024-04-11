import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/t_brand_card.dart';
import 'package:prashant_e_commerce_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        giventitle: Text('Nike'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //brand detail

            TBrandcard(showBorder: true),
            SizedBox(height: TSizes.spaceBtwSections,),
            TSortableProducts(),
          ],
        ),
        ),
      ),
    );
  }
}
