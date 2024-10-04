import 'package:darkak_e_commerce_app/screens/sign_in_screen/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SignInController());
  }
}