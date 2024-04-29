import 'package:get/get.dart';
import 'package:prashant_e_commerce_project/data/repositories/banners/banner_repository.dart';

import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {


  // variables
  final carouselcurrentindex = 0.obs;
  
  final isloading = false.obs;

  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }



  // update page navigations dots

  void UpdatePageIndicator(index) {
    carouselcurrentindex.value = index;
  }

  // fetch banners

  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories

      isloading.value= true;

      //fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchbanner();


      //assign banners
      this.banners.assignAll(banners);

 } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
     isloading.value = false;
    }
  }
}




























// import 'package:get/get.dart';
// import 'package:prashant_e_commerce_project/data/repositories/categories/category_repository.dart';
// import 'package:prashant_e_commerce_project/utils/popups/loaders.dart';

// import '../models/banner_model.dart';

// class BannerController extends GetxController {
//   static BannerController get instance => Get.find();
//   final isloading = false.obs;
//   final _categoryRepository = Get.put(CategoryRepository());

//   RxList<BannerModel> getAllBanners = <BannerModel>[].obs;
//   RxList<BannerModel> featuredbanners = <BannerModel>[].obs;
//   @override
//   void onInit() {
//     fetchBanners();
//     super.onInit();
//   }

//   // load category data
//   Future<void> fetchBanners() async {
//     try {
//       // show loader while loading banner
//       isloading.value = true;

//       // fetch banner from data source(firestore, API, etc.)
//       final banner = await _categoryRepository.getAllBanners();

//       // update the categories list

//       getAllBanners.assignAll(banner);
//       // filter featured categories

//       featuredbanners.assignAll(getAllBanners.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//      isloading.value = false;
//     }
//   }

//   // load selected category data

//   // get category or sub category products
// }









