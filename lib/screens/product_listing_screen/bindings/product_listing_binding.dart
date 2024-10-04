import 'package:darkak_e_commerce_app/screens/product_listing_screen/controllers/product_listing_controller.dart';
import 'package:get/get.dart';

class ProductListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListingController());
  }
}
