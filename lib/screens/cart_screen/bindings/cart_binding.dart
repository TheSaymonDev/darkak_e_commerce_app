import 'package:darkak_e_commerce_app/screens/cart_screen/controllers/cart_item_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CartItemController());
  }
}