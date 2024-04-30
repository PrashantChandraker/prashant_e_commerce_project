import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prashant_e_commerce_project/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:prashant_e_commerce_project/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/address/address.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/profile/profile.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../upload_image_to_firebase.dart';
import '../../../shop/screens/order/order_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHEaderContainer(
              thechild: Column(
                children: [
                  TAppBar(
                    giventitle: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  //User PRofile Card

                   UserProfileTile(
                  onPressed: () =>Get.to(() => const ProfileScreen(),), ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            //body
           Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                //acount setting
                children: [
                  const TSectionHeading(
                    title: 'Acoount Settings',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Adresses',
                    subtitle: 'Set Shopping delivery adress',
                    ontap:()=> Get.to(()=> const UserAddressScreen(),),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add,remove products and move to checkout',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In Progress and completed Orders',
                    ontap: () => Get.to(() => const TOrderScreen(),),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Accounts',
                    subtitle: 'Withdraw balance to registered bank accounts',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupuons',
                    subtitle: 'List of all the dicount coupons',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Accounts Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    ontap: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App settings', showactionbutton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                   TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Admin pannel',
                      subtitle: 'Upload data to your cloud firebase',
                      ontap: () => Get.to(()=> UploadImageToFirebase(),),
                      ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendations based on locations',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safemode',
                    subtitle: 'Seach result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen ',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  //logout button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: ()=>Get.offAll(()=>const LoginScreen()), child: const Text('Logout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
