
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });
final  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    // final imagecontroller = Get.put(ProfileScreen());
    return ListTile(
      leading: TCircularImage(image: controller.user.value.profilePicture, width: 50, height: 50,padding: 0, isNetworkImage: true,),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      overflow: TextOverflow.ellipsis,),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}
