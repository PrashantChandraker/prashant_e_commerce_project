
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });
final  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(image: TImages.prashant, width: 50, height: 50,padding: 0,),
      title: Text('Prashant Chandraker', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('Prashantchandraker@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      overflow: TextOverflow.ellipsis,),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}
