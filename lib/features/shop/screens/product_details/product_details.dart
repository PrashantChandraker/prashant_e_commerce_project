import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            TCurvedEdgeWidget(
              givenchild: Container(
                color: dark ? TColors.darkerGrey : TColors.white,
                child: Stack(
                  children: [
                    //main large image
                    SizedBox(
                      height: 400,

                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.productImageRadius *2),
                        child: Center(child: Image(image: AssetImage(TImages.mobilelogo))),
                      ))
                  ],
                ),
              ),
            )
            //product details
          ],
        ),
      ),
    );
  }
}
