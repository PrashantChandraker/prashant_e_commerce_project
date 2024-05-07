import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/banners/banner_repository.dart';
import 'package:prashant_e_commerce_project/data/repositories/brands/brand_repository.dart';
import 'package:prashant_e_commerce_project/data/repositories/product/product_repository.dart';
import 'package:prashant_e_commerce_project/data/services/dummy_data.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import 'data/repositories/categories/category_repository.dart';

class UploadImageToFirebase extends StatelessWidget {
  UploadImageToFirebase({super.key});
  final mycontroller = CategoryRepository.instance;
  final bannercontroller = BannerRepository.instance;
  final productController =ProductRepository.instance;

  final brand = Get.put(BrandRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Main Record',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Categories',
                      ontapp:  () => mycontroller.uploadDummyData(DummyData.categories),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.storefront_outlined,
                      text: 'Upload brands',
                      ontapp: () {
                        brand.uploadBrandData(DummyData.brands);

                      },
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.shopping_cart_outlined,
                      text: 'Upload Products',
                      ontapp: ()=>productController.uploadProductData(DummyData.products),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Banners',
                     ontapp: () => bannercontroller.uploadBannerImages(DummyData.banners),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                'Relationships',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Make sure you have already uploaded all the content above',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.black),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload Brands & \nCategories Relation Data',
                      ontapp: () {},
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload products \nCategories Relation Data',
                      ontapp: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







class UplaodDataTile extends StatelessWidget {
  const UplaodDataTile({
    super.key,
    required this.text,
    required this.icon1,
    required this.ontapp,
  });

  final String text;
  final IconData icon1;
  final VoidCallback ontapp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 30,
          color: const Color.fromARGB(255, 63, 72, 141),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(
          flex: 6,
        ),
        IconButton(onPressed: ontapp, icon: const Icon(Icons.upload, color:  Color.fromARGB(255, 63, 72, 141),))
      ],
    );
  }
}
