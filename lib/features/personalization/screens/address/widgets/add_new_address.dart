

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/address_controller.dart';

class AddNewAdressScreen extends StatelessWidget {
  const AddNewAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showbackarrow: true,
        titlee: Text('Add new adress'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validateEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,   
                        ),
                        labelText: 'Name'),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: TValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.mobile,
                        ),
                        labelText: 'mobile'),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) =>
                              TValidator.validateEmptyText('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building_3,
                              ),
                              labelText: 'Street'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => TValidator.validateEmptyText(
                              'Postal Code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.code,
                              ),
                              labelText: 'Postal code'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              TValidator.validateEmptyText('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building,
                              ),
                              labelText: 'City'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              TValidator.validateEmptyText('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.code,
                              ),
                              labelText: 'State'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.validateEmptyText('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(height: TSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(),
                        child: const Text('Save')),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}