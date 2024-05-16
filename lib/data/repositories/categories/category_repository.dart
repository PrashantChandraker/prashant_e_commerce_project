import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/features/shop/models/banner_model.dart';
import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/firebase_exception.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/platform_exception.dart';
import 'firebase_storage_services.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

 //get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somethimg went wrong .please try again';
    }
  }

  // upload categories to the cloud firebase

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories along with thier images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var category in categories) {
        // Get image data link with local asssets
        final file = await storage.getImageDataFromAssets(category.image);
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // assign URL to category.image attribute
        category.image = url;

        //store category in firestore

        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again later';
    }
  }




    //Get all banners
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('Banners').get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }


  //upload banner images
  // Future<void> uploadBannerImages(List<BannerModel> banner) async {
  //   try {
  //     // upload all the categories along with thier images
  //     final storage = Get.put(TFirebaseStorageService());

  //     //loop through each category
  //     for (var banner in banner) {
  //       // Get image data link with local asssets
  //       final file = await storage.getImageDataFromAssets(banner.image);
  //       final url = await storage.uploadImageData('Banners', file, banner.name);

  //       // assign URL to category.image attribute
  //       banner.image = url;

  //       //store category in firestore

  //       await _db
  //           .collection("Banners")
  //           .doc(banner.id)
  //           .set(banner.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformExceptions(e.code).message;
  //   } catch (e) {
  //     throw 'something went wrong, please try again later';
  //   }
  // }
}
