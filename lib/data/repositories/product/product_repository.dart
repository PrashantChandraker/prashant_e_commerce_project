import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/categories/firebase_storage_services.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/firebase_exception.dart';
import 'package:prashant_e_commerce_project/utils/exceptions/platform_exception.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';


//Repostories for managing product-related data and operations
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //Firestore instance for database interaction
  final _db = FirebaseFirestore.instance;

  //Get limited featured products

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {

      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //Upload dummydata to the cloud firestore
  Future<void> uploadProductData(List<ProductModel> products) async {
    try {
      //upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each products
      for (var product in products) {
        //Get image data link from local assest
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        //upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        //assign URL to product thumbail attribute
        product.thumbnail = url;

        //Products list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            //get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //uplaod image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //Assign url to product.thumnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //upload variation images
        if (product.productType == ProductType.single.toString()) {
          for (var variation in product.productVariations!) {
            //Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //assign URL to variation.image attritube
            variation.image = url;
          }
        }
        //store product in firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
