import 'package:darkak_e_commerce_app/screens/onboarding_screen/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}