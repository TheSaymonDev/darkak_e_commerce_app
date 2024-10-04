import 'package:darkak_e_commerce_app/screens/set_password_screen/controllers/set_password_controller.dart';
import 'package:get/get.dart';

class SetPasswordBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SetPasswordController());
  }
}