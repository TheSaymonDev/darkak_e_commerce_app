import 'package:darkak_e_commerce_app/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}