

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/brand_category_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';
import '../categories/firebase_storage_services.dart';

class BrandCategoryRepository extends GetxController{
  static BrandCategoryRepository get instance => Get.find();


  // variables
  final _db = FirebaseFirestore.instance;



  // Get all order related to current user

  // Future<List<BrandCategoryModel>> fetchbanner() async{
  //   try{
  //       final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
  //       return result.docs.map((DocumentSnapshot) => BrandCategoryModel.fromSnapshot(DocumentSnapshot)).toList();
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformExceptions(e.code).message;
  //   } catch (e) {
  //     throw 'something went wrong, please try again later';
  //   }
  // }



  //upload brand_category_Inside to the cloud firebase

   //upload brand_category images
  Future<void> uploadBrandCategory(List<BrandCategoryModel> brandcategory) async {
  try {
    for (var brandCategory in brandcategory) {
      // Store category in Firestore
      await _db
          .collection("BrandCategoryinside")
          .doc(brandCategory.categoryId)
          .set({
            'brandId': brandCategory.brandId,
            'categoryId': brandCategory.categoryId,
          });
    }
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformExceptions(e.code).message;
  } catch (e) {
    throw 'Something went wrong, please try again later';
  }
}


}