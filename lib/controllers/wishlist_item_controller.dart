import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class WishListItemController extends GetxController {
  bool isLoading = false;
  List<Product> wishListItem = [];
  Future<void> getWishListItem() async {
    isLoading = true;
    update();
    try {
      final responseData = await ApiService().getApi(Urls.getWishListProductUrl,
          header: Urls.requestHeaderWithToken);
      if (responseData != null) {
        List<dynamic> data = responseData;
        if (data.isNotEmpty) {
          wishListItem = data.map((item) => Product.fromJson(item)).toList();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      } else {
        customErrorMessage(message: 'Something Went Wrong');
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }
  Future<void> removeWishListItem(String id) async {
    try {
      final responseData =
      await ApiService().deleteApi('${Urls.removeWishListItemUrl}/$id');
      if (responseData != null) {
        customSuccessMessage(message: 'Product Successfully Remove From Wishlist');
        wishListItem.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
      } else {
        customErrorMessage(message: 'Wishlist Item Remove Failed');
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }

  // Check if the product with the given id is in the wishlist
  bool isInWishlist(String id) {
    return wishListItem.any((product) => product.id == id);
  }
}
