import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/address/address_model.dart';
import 'package:prashant_e_commerce_project/data/repositories/authentication/authentication_repository.dart';

class AddressRepository extends GetxController{
  static AddressRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try{
      final userId = AuthenticationRepsitory.instance.authuser!.uid;
      if(userId.isEmpty) throw 'unable to find user information. Try again few minutes';
    
      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    
    
    }catch(e){
      throw 'Somethingwent wrong while fetching address information. try again later';
    }
  }

  // clear the selected field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepsitory.instance.authuser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    } catch(e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }


  //store new user order
  Future<String> addAddress(AddressModel address) async{
    try{
      final userId = AuthenticationRepsitory.instance.authuser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;

    } catch(e){
      throw 'something went wrong while saving address information. Try again later';
    }
  }
}