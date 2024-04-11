import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.giventitle,
      this.showbackarrow = false,
      this.leadingicon,
      this.givenactions,
      this.leadingonPRessed, this.backgroundColor, this.centerTitle, });

  final Widget? giventitle;
  final bool showbackarrow;
  final IconData? leadingicon;
  final List<Widget>? givenactions;
  final VoidCallback? leadingonPRessed;
  final Color? backgroundColor;
  final bool? centerTitle;
  
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon:  Icon(Iconsax.arrow_left, color: dark ? TColors.white : TColors.black,),
              )
            : leadingicon != null
                ? IconButton(
                    onPressed: leadingonPRessed,
                    icon: Icon(leadingicon),
                  )
                : null,

                title: giventitle,
               titleTextStyle: TextStyle(
                fontSize: TSizes.lg,
                color: dark? TColors.white: TColors.black),
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
