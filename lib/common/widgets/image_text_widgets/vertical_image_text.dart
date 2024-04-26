import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class TverticalCirculartextimage extends StatelessWidget {
  const TverticalCirculartextimage({
    super.key,
    required this.image,
    required this.title,
    this.textcolor = TColors.white,
    this.backgroundcolor = TColors.white,
    this.ontap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textcolor;
  final Color? backgroundcolor;
  final void Function()? ontap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkmode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //circular icon

            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundcolor ,
            //         // ?? (dark ? TColors.white : TColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       // fit: BoxFit.cover,
            //       // color: dark ? TColors.white : TColors.white,
            //     ),
            //   ),
            // ),

            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundcolor,
             
            ),

            // text

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: textcolor,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
