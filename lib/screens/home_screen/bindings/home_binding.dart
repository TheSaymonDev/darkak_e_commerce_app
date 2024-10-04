import 'package:darkak_e_commerce_app/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(BottomNavController());
  }
}