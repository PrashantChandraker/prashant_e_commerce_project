import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';
import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});



final String title;
final Query? query;
final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {

    // initialize controller for managing product fetching

    final controller = Get.put(AllProductsController());
    return  Scaffold(
      appBar: TAppBar(
        titlee: Text(title),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {


              //check the state of the futurebuilder snapshot
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // return appropriate widget based on snapshot state
              if(widget != null) return widget;

              // products found
              final products = snapshot.data!;
              return TSortableProducts(products: products,);
            },
          ),
        ),
      ),
    );
  }
}

