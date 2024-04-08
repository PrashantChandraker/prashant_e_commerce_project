
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const   TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageURL,
    this.applyImageRadius = true,
    this.border,
    this.backgroundcolor = TColors.light,
    this.fit =  BoxFit.fill,
    this.padding,
    this.isNetworkImage = false,
    this.onpressed,
     this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageURL;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onpressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            border: border,
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageURL)
                  : AssetImage(imageURL) as ImageProvider,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
