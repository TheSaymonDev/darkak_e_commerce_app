import 'package:darkak_e_commerce_app/screens/product_details_screen/controllers/add_to_cart_controller.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
    Get.lazyPut(() => AddToCartController());
  }
}
