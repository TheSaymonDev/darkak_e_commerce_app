import 'package:darkak_e_commerce_app/screens/help_and_support_screen/controllers/help_and_support_controller.dart';
import 'package:get/get.dart';

class HelpAndSupportBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HelpAndSupportController());
  }
}