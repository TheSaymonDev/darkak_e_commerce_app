// import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
// import 'package:darkak_e_commerce_app/screens/wishlist_screen/models/add_to_wishlist_model.dart';
// import 'package:darkak_e_commerce_app/services/api_service.dart';
// import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
// import 'package:darkak_e_commerce_app/utils/app_urls.dart';
// import 'package:darkak_e_commerce_app/widgets/styles.dart';
// import 'package:get/get.dart';
//
// class AddToWishListController extends GetxController {
//
// //   Future<void> addToWishList(String id) async {
// //     final data = {'productId': id};
// //     try {
// //       String token = SharedPreferencesService().getToken();
// //       Map<String, String> headerWithToken = {
// //         "Content-Type": "application/json",
// //         "Authorization": "Bearer $token"
// //       };
// //       final responseData = await ApiService().postApi(
// //           AppUrls.addToWishListUrl, data,
// //           header: headerWithToken);
// //       if (responseData != null && responseData != 404) {
// //         customSuccessMessage(message: 'Successfully Product Add To Wishlist');
// //         Get.find<WishListItemController>().getWishListItem();
// //       } else if (responseData == 404) {
// //         customErrorMessage(message: 'Already Added To Wishlist');
// //       } else {
// //         customErrorMessage(message: 'Something Went Wrong');
// //       }
// //     } catch (error) {
// //       customErrorMessage(message: error.toString());
// //     }
// //   }
//  }


import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/models/add_to_wishlist_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class AddToWishlistController extends GetxController {
  bool isLoading = false;
  Future<void> addToWishlist({required AddToWishlistModel addToWishlistData}) async {
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

