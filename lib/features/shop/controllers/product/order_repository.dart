import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import 'order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //----------Functions----------//
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepsitory.instance.authuser?.uid;
      if(userId==null || userId.isEmpty) {
      throw 'Uable to process order. userid is null or empty';
    };

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong whilen fetching order information.Try again later';
    }
  }

  //Store new user order

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong whilen saving order information.Try again later';
    }
  }
}