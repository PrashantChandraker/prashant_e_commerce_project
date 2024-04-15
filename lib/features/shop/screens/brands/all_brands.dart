import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/brands/t_brand_card.dart';
import 'package:prashant_e_commerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/brands/brand_products.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const TAppBar(
        giventitle: Text('Brand',),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [

            //Heading

            const TSectionHeading(title: 'Brands'),
            const SizedBox(height: TSizes.spaceBtwItems,),

            //brands

            TGridLayout(itemcount: 10,
            mainAxisExtent: 80,
             itemBuilder: (context, index)=> TBrandcard(showBorder: true, ontap: () => Get.to(()=>const BrandProducts()),),),

          ],
        ),
        ),
      ),
    );
  }
}