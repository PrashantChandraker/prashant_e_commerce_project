import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/features/personalization/controllers/address_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/checkout_controller.dart';
import 'package:prashant_e_commerce_project/features/shop/controllers/product/variation_controller.dart';
import 'package:prashant_e_commerce_project/network_manager.dart';

class GenralBindings extends Bindings{
  @override
 
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckOutController());
  }

}