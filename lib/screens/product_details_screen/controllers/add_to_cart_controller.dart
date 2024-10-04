import 'package:darkak_e_commerce_app/screens/cart_screen/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/model/add_to_cart_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool isLoading = false;
  Future<bool> addToCart({required AddToCartModel addToCartData}) async {
    _setLoading(true);
    try {
      final response =
      await ApiService().post(url: AppUrls.addToCartUrl, data: addToCartData, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Product Add To Cart');
        _setLoading(false);
        Get.find<CartItemController>().getCartItem();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }
  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
