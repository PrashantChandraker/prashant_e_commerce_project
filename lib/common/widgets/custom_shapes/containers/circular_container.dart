
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundcolor = TColors.white, 
    this.margin,
  });

  final double? width, height;
  final double padding, radius;
  final Widget? child;
  final Color? backgroundcolor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        width: width,
        height: height,
        margin:margin,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color:backgroundcolor,
        ),
        child: child,
      ),
    );
  }
}
