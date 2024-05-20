import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

import '../../shop_screen/model/product.dart';

class WishListItemController extends GetxController {
  bool isLoading = false;
  List<Product> wishListItems = [];
  // Future<void> getWishListItem() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService().getApi(AppUrls.getWishListProductUrl,
  //         header: headerWithToken);
  //     if (responseData != null) {
  //       List<dynamic> data = responseData;
  //       if (data.isNotEmpty) {
  //         wishListItems = data.map((item) => Product.fromJson(item)).toList();
  //         isLoading = false;
  //         update();
  //       } else {
  //         isLoading = false;
  //         update();
  //       }
  //     } else {
  //       customErrorMessage(message: 'Something Went Wrong');
  //       isLoading = false;
  //       update();
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     isLoading = false;
  //     update();
  //   }
  // }

  Future<void> getWishListItem() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getWishListProductUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        wishListItems = data.map((item) => Product.fromJson(item)).toList();
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  // Future<void> removeWishListItem(String id) async {
  //   try {
  //     final responseData =
  //     await ApiService().deleteApi('${AppUrls.removeWishListItemUrl}/$id');
  //     if (responseData != null) {
  //       customSuccessMessage(message: 'Product Successfully Remove From Wishlist');
  //       wishListItems.removeWhere((element) => element.id == id);
  //       update(); // Force UI update after removal from list
  //     } else {
  //       customErrorMessage(message: 'Wishlist Item Remove Failed');
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //   }
  // }

  Future<void> removeWishListItem(String id)async{
    try {
      final response = await ApiService().delete(url: '${AppUrls.removeWishListItemUrl}/$id', headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Product Successfully Remove From Wishlist');
        wishListItems.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
      } else {
        final errorMessage =
            response.message['message'] ?? 'Wishlist Item Remove Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  // Check if the product with the given id is in the wishlist
  bool isInWishlist(String id) {
    return wishListItems.any((product) => product.id == id);
  }
}
