import 'package:get/get.dart';

class OnboardingController extends GetxController{
  int currentPage = 0;

  void onPageChange(index){
    currentPage=index;
    update();
  }

  void onDotClick(index){
    currentPage=index;
    update();
  }
}