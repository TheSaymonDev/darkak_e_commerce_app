import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/order_package_controller.dart';
import 'package:get/get.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderPackageController());
  }
}
