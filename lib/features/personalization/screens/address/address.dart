import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';
import '../../controllers/address_controller.dart';
import 'widgets/Tsingle_address.dart';
import 'widgets/add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAdressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              //use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddress(),
                builder: (context, snapshot) {
                  //helper function,handle loader,no record,or error message
                  final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;
            
                  final adresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: adresses.length,
                      itemBuilder: (_, index) =>
                          SingleAddress(address:adresses[index], onTap: ()=>controller.selectAddress(adresses[index]),));
                }),
          ),
        ),
      ),
    );
  }
}