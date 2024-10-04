import 'package:darkak_e_commerce_app/screens/my_order_screen/controllers/my_order_controller.dart';
import 'package:get/get.dart';

class MyOrderBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrderController());
  }
}