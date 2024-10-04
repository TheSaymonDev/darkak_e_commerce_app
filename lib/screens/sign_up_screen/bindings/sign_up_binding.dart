import 'package:darkak_e_commerce_app/screens/sign_up_screen/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SignUpController());
  }
}