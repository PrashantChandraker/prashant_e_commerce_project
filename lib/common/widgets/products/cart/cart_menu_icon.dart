import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, required this.iconcolor, required this.onPressed,
  });


final Color iconcolor;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon:  Icon(
            Iconsax.shopping_cart,
            color:iconcolor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: TColors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(
                        color: TColors.white,
                        fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}