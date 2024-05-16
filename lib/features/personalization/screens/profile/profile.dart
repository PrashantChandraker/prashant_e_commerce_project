import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/shimmers/shimmer.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/personalization/controllers/user_controller.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/profile/widgets/changename.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        // onpressed: () => Get.to(()=>SettingsScreen()),
        showbackarrow: true,
        titlee: Text('Profile'),
      ),
      // appBar: AppBar(centerTitle: true,
      // title: Text('Profile'),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final Image = networkImage.isNotEmpty
                          ? networkImage
                          : TImages.demouser;
                      return controller.imageuploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: Image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.UploadprofilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              //details
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showactionbutton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                onPressed: () => Get.off(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User Name',
                value: controller.user.value.username,
                icon: null,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Personal Information',
                showactionbutton: false,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User-ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),

              TProfileMenu(
                  onPressed: () {},
                  title: 'Email-ID',
                  value: controller.user.value.email),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Contact no.',
                  value: controller.user.value.phoneNumber),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
                icon: null,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'DOB',
                value: '08/07/1999',
                icon: null,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
