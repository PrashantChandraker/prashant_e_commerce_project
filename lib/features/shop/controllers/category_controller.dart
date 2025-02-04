
import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/categories/category_repository.dart';
import 'package:prashant_e_commerce_project/data/repositories/product/product_repository.dart';
import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isloading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isloading.value = true;

      // fetch categories from data source(firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list

      allCategories.assignAll(categories);
      // filter featured categories

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
     isloading.value = false;
    }
  }

//load selected category data

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // get category or sub category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId,  }) async {
    // fetch limited (4) products against each sub category;
  try{
     final products = await ProductRepository.instance.getProductsForCategory(categoryId :categoryId , );
    return products;
  } catch(e){
    TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    return [];
  }
   
  }


}
