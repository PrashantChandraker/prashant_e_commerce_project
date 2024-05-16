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
          .where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //Get limited featured products

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
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

  //Get products based on the query

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }


  //Get products based on the query for favourites
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final QuerySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = QuerySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId,}) async {
    try {
      // query to get all documents where product id matches the provided categoryId and fetch limitted and unlimited data based on limit
      QuerySnapshot productcategoryQuery = await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get();

          // extract products from the documnets 
          List<String> productIds  = productcategoryQuery.docs.map((doc) => doc['productId'] as String ).toList();

          // QUery to get all documents where the brandId is in the list of brand ids , feildpath.documentId to query documents in collection

          final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();


          // extract brand name  or othere relevant data from th documents 
          List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

          return products;



    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
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

        if (product.brand?.image != null) {
          final imageData =
              await storage.getImageDataFromAssets(product.brand!.image);
          final url = await storage.uploadImageData(
              'Brands/Images', imageData, product.brand!.image);
          product.brand!.image = url;
        }

        //upload variation images
        if (product.productType == ProductType.variable.toString()) {
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

        //upload single images
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
