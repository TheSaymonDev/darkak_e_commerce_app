import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/model/final_cart_item.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  bool isLoading = false;
  List<CartItem> cartItems = [];

  // Future<void> getCartItem() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService().getApi(AppUrls.getCartItemUrl, header: headerWithToken);
  //     if (responseData != null) {
  //       List<dynamic> data = responseData;
  //       if (data.isNotEmpty) {
  //         cartItems = data.map((item) => CartItem.fromJson(item)).toList();
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

  Future<void> getCartItem() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getCartItemUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        cartItems = data.map((item) => CartItem.fromJson(item)).toList();
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



  // Future<void> removeCartItem(String id) async {
  //   try {
  //     final responseData =
  //         await ApiService().deleteApi('${AppUrls.removeCartItemUrl}/$id');
  //     if (responseData != null) {
  //       customSuccessMessage(message: 'Cart Item Successfully Removed');
  //       cartItems.removeWhere((element) => element.id == id);
  //       update();
  //     } else {
  //       customErrorMessage(message: 'Cart Item Remove Failed');
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //   }
  // }

  Future<void> removeCartItem(String id)async{
    try {
      final response = await ApiService().delete(url: '${AppUrls.removeCartItemUrl}/$id', headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Cart Item Successfully Removed');
        cartItems.removeWhere((element) => element.id == id);
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Cart Item Remove Failed';
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

  void incrementQuantity(int index) {
    if (cartItems[index].quantity! <
        cartItems[index].products!.alertQuantity!) {
      cartItems[index].quantity = (cartItems[index].quantity! + 1);
      update();
    }
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity! > 1) {
      cartItems[index].quantity = (cartItems[index].quantity! - 1);
      update();
    }
  }

  int calculateSubTotal() {
    double subTotal = 0.0;
    for (var item in cartItems) {
      subTotal += item.products!.offerPrice != null
          ? item.quantity! * item.products!.offerPrice!
          : 0.0;
    }
    int roundSubTotal = subTotal.round();
    return roundSubTotal;
  }

  void clearCartItems() {
    cartItems.clear(); // Clear the cartItemList
    update(); // Update the UI to reflect the empty cart
  }
}
