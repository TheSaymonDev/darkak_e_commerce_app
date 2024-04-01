import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  int currentIndex = 0;

  void changeIndex(int index){
    if(currentIndex==index){
      return;
    }currentIndex=index;
    update();
  }

}