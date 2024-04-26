import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';
import '../categories/firebase_storage_services.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();


  // variables
  final _db = FirebaseFirestore.instance;



  // Get all order related to current user

  Future<List<BannerModel>> fetchbanner() async{
    try{
        final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
        return result.docs.map((DocumentSnapshot) => BannerModel.fromSnapshot(DocumentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again later';
    }
  }



  //upload banners to the cloud firebase

   //upload banner images
  Future<void> uploadBannerImages(List<BannerModel> banner) async {
    try {
      // upload all the categories along with thier images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var banner in banner) {
        // Get image data link with local asssets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        final url = await storage.uploadImageData('Banners', file, banner.targetScreen);

        // assign URL to category.image attribute
        banner.imageUrl = url;

        //store category in firestore

        await _db
            .collection("Banners")
            .doc(banner.targetScreen)
            .set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again later';
    }
  }

}