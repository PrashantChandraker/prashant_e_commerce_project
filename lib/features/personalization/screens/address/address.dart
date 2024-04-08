import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/common/widgets/appbar/appbar.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/address/widgets/Tsingle_address.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';
import 'package:prashant_e_commerce_project/utils/helpers/helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddNewAddressScreen(),
        ),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
        backgroundColor: TColors.primary,
      ),
      appBar: TAppBar(
        showbackarrow: true,
        giventitle: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: true),
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: false),
              SingleAddress(selectedaddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
