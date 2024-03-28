import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_order_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  bool isLoading = false;
  Future<bool> createOrder({
    required List<String> carts,
    required String address,
    required int amount,
    required String delivery,
  }) async {
    isLoading = true;
    update();
    final order = OrderModel(
        carts: carts,
        address: address,
        amount: amount,
        paymentMethod: 'CASH_ON_DELIVERY',
        delivery: delivery,
        note: 'Deliver This Product');
    try {
      final responseData = await ApiService().postApi(
          Urls.createOrderUrl, order,
          header: Urls.requestHeaderWithToken);
      if (responseData != null && responseData != 404) {
        customSuccessMessage(message: 'Successfully Order');
        Get.find<CartItemController>().getCartItem();
        isLoading = false;
        update();
        return true;
      } else if (responseData == 404) {
        customErrorMessage(message: 'Product Already Ordered');
        isLoading = false;
        update();
        return false;
      } else {
        customErrorMessage(message: 'Something went wrong');
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }
}
