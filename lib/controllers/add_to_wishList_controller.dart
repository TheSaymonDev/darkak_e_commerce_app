import 'package:darkak_e_commerce_app/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {

  Future<void> addToWishList(String id) async {
    final data = {'productId': id};
    try {
      final responseData = await ApiService().postApi(
          Urls.addToWishListUrl, data,
          header: Urls.requestHeaderWithToken);
      if (responseData != null && responseData != 404) {
        customSuccessMessage(message: 'Successfully Product Add To Wishlist');
        Get.find<WishListItemController>().getWishListItem();
      } else if (responseData == 404) {
        customErrorMessage(message: 'Already Added To Wishlist');
      } else {
        customErrorMessage(message: 'Something Went Wrong');
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }
}
