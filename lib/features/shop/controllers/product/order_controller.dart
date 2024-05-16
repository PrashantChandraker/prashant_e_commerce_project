
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:prashant_e_commerce_project/navigation.dart';

import '../../../../common/widgets/success_screen/successScreen.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image.strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/address_controller.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';
import 'order_model.dart';
import 'order_repository.dart';

class OrderController extends GetxController{
  static OrderController get instance=> Get.find();

  //variables
  final cartController=CartController.instance;
  final addressController=AddressController.instance;
  final checkoutController=CheckOutController.instance;
  final orderRepository=Get.put(OrderRepository());

  //fetch users order history
  Future<List<OrderModel>> fetchUserOrders() async{

    try{
      final userOrders=await orderRepository.fetchUserOrders();
      return userOrders;
    }catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
      return[];
    }
  }










  // add methods for processing order
  void processOrder(double totalAmount) async{
  try{
    //start loder
    TFullScreenLoader.openLoadingDialog('Processing your order', TImages.loading);

    //Get user authentication id
    final userId= AuthenticationRepsitory.instance.authuser?.uid;
    if(userId==null || userId.isEmpty) {
      throw 'Uable to process order. userid is null or empty';
    };

    //add details
    final order=OrderModel(
      id: UniqueKey().toString(), 
      userId: userId,
      status: OrderStatus.pending, 
          totalAmount: totalAmount, 
             orderDate: DateTime.now(),
             paymentMethod: checkoutController.selectPaymentMethod.value.name,
             address: addressController.selectedAddress.value,
             //set date as needed
             deliveryDate: DateTime.now(),


   
      items:cartController.cartItems.toList(), 
  
   );

   //save the order to firestore
   await orderRepository.saveOrder(order, userId);

   //Update the cart status
   cartController.clearCart();

   //show success screen
   Get.off(()=> SuccessScreen(
    givenimage: TImages.successlogo, 
    title: 'Payment Sucess!', 
    subtitle: 'Your item will be shipped soon!', 
    onpressedbutton: ()=> Get.offAll(()=> const NavigationMenu())
    ));

  }catch(e){
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
  }
}

}