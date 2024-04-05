
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final CarouselControllerIndex = 0.obs;


  void UpdatePageIndicator(index) {
     CarouselControllerIndex.value = index;
  }
}