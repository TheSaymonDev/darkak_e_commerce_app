import 'package:darkak_e_commerce_app/screens/identity_verification_screen/controllers/identity_verification_controller.dart';
import 'package:get/get.dart';

class IdentityVerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => IdentityVerificationController());
  }
}