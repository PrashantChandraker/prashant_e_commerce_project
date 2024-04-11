import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:prashant_e_commerce_project/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();


////variables
final pageController = PageController();
Rx<int> currentPageIndex = 0.obs;
////// update currentindex when page scroll
void updatePageIndicator(index) => currentPageIndex.value = index;


// Jump to the specific dot selected page

void dotNavigationClick(index) {
  currentPageIndex.value = index;
  pageController.jumpTo(index);

}


///update current index & jump to next page

void nextPage() {
  if(currentPageIndex.value ==2)
  {

    final storage = GetStorage();

    if(kDebugMode){
  print('-------------storage  next button--------');
  print(storage.read('IsFirstTime'));
}


    storage.write('IsFirstTime', false);
    Get.offAll(const LoginScreen());
  }
  else{
    int page = currentPageIndex.value +1;
    pageController.jumpToPage(page);
  }
}


// Update current index & jump to the last page 

void skipPage() {
  currentPageIndex.value =2;
  pageController.jumpToPage(2);
}



}

