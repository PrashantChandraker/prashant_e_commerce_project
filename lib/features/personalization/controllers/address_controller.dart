import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/address/widgets/Tsingle_address.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:prashant_e_commerce_project/utils/constants/sizes.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../data/repositories/address/address_model.dart';
import '../../../data/repositories/address/address_repository.dart';
import '../../../network_manager.dart';
import '../../../utils/constants/image.strings.dart';
import '../../../utils/helpers/cloud_helper_function.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  //fetch all user specific address
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {

      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TcircularLoader(),
      );
      //clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      //assign selected addresss
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //set the selected field to true for the mewly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
          Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  // add new address
  Future addNewAddress() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.loading);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //save address date
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      //update selected address status
      address.id = id;
      await selectedAddress(address);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');

      //refresh address data
      refreshData.toggle();

      //reset fields
      resetFormFields();

      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }


//show addresses modelbottom sheet at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(
                    title: 'Select Address',
                    showactionbutton: false,
                  ),
                  FutureBuilder(
                    future: getAllUserAddress(),
                    builder: (_, snapshot) {
                      // Helper function: handle loader, no record, or error message
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if (response != null) return response;

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No addresses found'),
                        );
                      }

                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.5,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            if (index >= snapshot.data!.length) {
                              return const SizedBox.shrink();
                            }
                            return SingleAddress(
                              address: snapshot.data![index],
                              onTap: () async {
                                await selectedAddress(snapshot.data![index]);
                                Get.back();
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: TSizes.defaultSpace * 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const AddNewAdressScreen()),
                      child: const Text('Add new address'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }


  //Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}



class TcircularLoader extends StatelessWidget {
  const TcircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
