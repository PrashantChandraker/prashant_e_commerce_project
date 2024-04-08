import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/common/widgets/images/t_circular_images.dart';
import 'package:prashant_e_commerce_project/common/widgets/texts/section_heading.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showbackarrow: true,
        giventitle: Text('Profile'),
      ),

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
                    TCircularImage(
                      image: TImages.prashant,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              //details
              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TSectionHeading(title: 'Profile Information', showactionbutton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),


              TProfileMenu(onPressed: () {}, title: 'Name', value: 'Pashant Chandraker'),
              TProfileMenu(onPressed: () {}, title: 'User Name', value: 'Pashant_08',  icon: null,),
               const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
               const TSectionHeading(title: 'Personal Information', showactionbutton: false,),
              TProfileMenu(onPressed: () {}, title: 'User-ID', value: '0608', icon: Iconsax.copy,),
               TProfileMenu(onPressed: () {}, title: 'Email-ID', value: 'prashantchandraker1@gmail.com'),
              TProfileMenu(onPressed: () {}, title: 'Contact no.', value: '8827530290'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male', icon: null,),
              TProfileMenu(onPressed: () {}, title: 'DOB', value: '08/07/1999',  icon: null,),
               const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Center(child: TextButton(onPressed: () {}, child: const Text('Delete Account', style: TextStyle(color: Colors.red),),),)

            ],
          ),

          
        ),
      ),
    );
  }
}
