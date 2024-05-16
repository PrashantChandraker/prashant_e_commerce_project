
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_function.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.titlee,
      this.showbackarrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.color,});

  final Widget? titlee;
  final Color? color;
  final bool showbackarrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: dark ? TColors.white : TColors.dark,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: titlee,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceutils.getAppBarHeight());
}