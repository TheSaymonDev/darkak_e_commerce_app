import 'package:get/get.dart';

class BottomNavController extends GetxController{
  int currentIndex = 0;

  void changeIndex(int index){
    if(currentIndex==index){
      return;
    }currentIndex=index;
    update();
  }

  void backToHomeScreen(){
    changeIndex(0);
    update();
  }

}