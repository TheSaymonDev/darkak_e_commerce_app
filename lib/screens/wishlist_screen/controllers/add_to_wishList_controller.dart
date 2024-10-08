import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/models/add_to_wishlist_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class AddToWishlistController extends GetxController {
  bool isLoading = false;
  Future<void> addToWishlist({required AddToWishlistModel addToWishlistData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
    try {
      final response =
      await ApiService().post(url: AppUrls.addToWishListUrl, data: addToWishlistData, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Product Add To Wishlist');
        Get.find<WishListItemController>().getWishListItem();
      } else {
        final errorMessage = response.message['message'] ?? 'Add to wishlist Failed';
        customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }

}

