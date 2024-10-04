import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class WishListItemController extends GetxController {
  bool isLoading = false;
  List<ProductModel> wishListItemsData = [];

  Future<void> getWishListItem() async {
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getWishListProductUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        wishListItemsData =
            data.map((item) => ProductModel.fromJson(item)).toList();
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> removeWishListItem(String id) async {
    try {
      final response = await ApiService().delete(
          url: '${AppUrls.removeWishListItemUrl}/$id',
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(
            message: 'Product Successfully Remove From Wishlist');
        wishListItemsData.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
      } else {
        final errorMessage =
            response.message['message'] ?? 'Wishlist Item Remove Failed';
        customErrorMessage(message: errorMessage);
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      update();
    }
  }

  // Check if the product with the given id is in the wishlist
  bool isInWishlist(String id) {
    return wishListItemsData.any((product) => product.id == id);
  }

  @override
  void onInit() {
    super.onInit();
    final token = SharedPreferencesService().getToken();
    if (token.isNotEmpty) {
      getWishListItem();
    }
  }
}
