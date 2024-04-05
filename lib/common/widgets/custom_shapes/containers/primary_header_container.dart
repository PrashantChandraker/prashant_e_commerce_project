import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class TPrimaryHEaderContainer extends StatelessWidget {
  const TPrimaryHEaderContainer({
    super.key,
    required this.thechild,
  });

  final Widget thechild;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      givenchild: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1),
                ),
              ),

              // jo hamne upar common widget variable liya hai
              thechild,
            ],
          ),
        ),
      ),
    );
  }
}
