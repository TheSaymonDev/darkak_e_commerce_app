import 'package:darkak_e_commerce_app/screens/cart_screen/controller/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/model/final_add_to_cart.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
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
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService().postApi(
          AppUrls.addToCartUrl, addToCart,
          header: headerWithToken);
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
