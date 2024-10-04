import 'package:darkak_e_commerce_app/screens/product_view_screen/controllers/product_view_controller.dart';
import 'package:get/get.dart';

class ProductViewBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductViewController());
  }
}