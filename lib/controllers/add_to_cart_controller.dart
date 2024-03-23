import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/add_to_cart.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool isLoading = false;
  Future<void> addToCart(
      {required String productId,
      required String productSize,
      required String productColor,
      required String productQuantity}) async {
    isLoading = true;
    update();
    final addToCart = AddToCart(
        productId: productId,
        size: productSize,
        color: productColor,
        quantity: productQuantity);
    try {
      final responseData = await ApiService().postApi(
          Urls.addToCartUrl, addToCart,
          header: Urls.requestHeaderWithToken);
      if (responseData != null && responseData != 404) {
        customSuccessMessage(message: 'Successfully Product Add To Cart');
        isLoading = false;
        update();
        Get.find<CartItemController>().getCartItem();
      } else if (responseData == 404) {
        customErrorMessage(message: 'Already Added To Cart');
        isLoading = false;
        update();
      } else {
        customErrorMessage(message: 'Hi i am add to cart Something Went Wrong');
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }
}
