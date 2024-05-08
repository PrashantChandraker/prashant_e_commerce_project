import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/shop/controllers/category_controller.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';
import '../categories/firebase_storage_services.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
          print("All Brands ==${result}");
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

// Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryid) async {
    try {
     // Query to get all documents where categoryID matches the provided categorId
     QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryid).get();

     // extract brandids from the documents
     List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String ).toList();

     // Query to get all documents where the brandId is in the list of brandIds, Fieldpath.documentId to qery documents in collection,
     final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

     // extract brand names or other relevant data from the documents
     List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

     return brands;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }




  
//upload brands data to the firebase

 Future<void> uploadBrandData(List<BrandModel> brands) async {
  try {
    // Upload all the brands along with their images
    final storage = Get.put(TFirebaseStorageService());

    // Loop through each brand
    for (var brand in brands) {
      // Get image data link from the local assets
      final file = await storage.getImageDataFromAssets(brand.image);

      // Upload image and get its URL
      final url = await storage.uploadImageData('Brands', file, brand.id);

      // Assign URL to BrandModel.image attribute
      brand.image = url;

      // Store brand in Firestore
      await FirebaseFirestore.instance.collection('Brands').doc(brand.id).set(brand.toJson());
    }

    // Not sure what CategoryController does here, so keeping it as it is
    Get.put(CategoryController());
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformExceptions(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

}