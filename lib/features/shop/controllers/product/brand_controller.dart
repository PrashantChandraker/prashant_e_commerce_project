
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/product/product_repository.dart';
import 'package:prashant_e_commerce_project/features/shop/models/product_model.dart';

import '../../../../data/repositories/brands/brand_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/brand_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //--load brands
  Future<void> getFeaturedBrands() async {
    try {
      //show loader while lodaing brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Stop loader
      isLoading.value = false;
    }
  }
  //--set brands for category


  
  //--get brand specific Products from your data source

  Future<List<ProductModel>> getBrandProducts(String brandId) async{
   try{
     final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId);
    return products;
   }
   catch (e){
    TLoaders.errorSnackBar(title: 'Ohh Snap!',message: e.toString());
    return[];
   }
  }

 
}