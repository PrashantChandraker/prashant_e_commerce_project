import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.giventitle,
      this.showbackarrow = false,
      this.leadingicon,
      this.givenactions,
      this.leadingonPRessed, this.backgroundColor, });

  final Widget? giventitle;
  final bool showbackarrow;
  final IconData? leadingicon;
  final List<Widget>? givenactions;
  final VoidCallback? leadingonPRessed;
  final Color? backgroundColor;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              )
            : leadingicon != null
                ? IconButton(
                    onPressed: leadingonPRessed,
                    icon: Icon(leadingicon),
                  )
                : null,

                title: giventitle,
               
                actions: givenactions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(
        TDeviceutils.getAppBarHeight(),
      );
}
