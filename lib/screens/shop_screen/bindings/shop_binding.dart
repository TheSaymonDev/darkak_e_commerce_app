import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:get/get.dart';

class ShopBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ProductListController());
  }
}