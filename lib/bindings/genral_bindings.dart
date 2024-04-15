import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/network_manager.dart';

class GenralBindings extends Bindings{
  @override
 
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}