import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_cart_item.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  bool isLoading = false;
  List<CartItem> cartItemList = [];

  Future<void> getCartItem() async {
    isLoading = true;
    update();
    try {
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService().getApi(Urls.getCartItemUrl, header: headerWithToken);
      if (responseData != null) {
        List<dynamic> data = responseData;
        if (data.isNotEmpty) {
          cartItemList = data.map((item) => CartItem.fromJson(item)).toList();
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

  Future<void> removeCartItem(String id) async {
    try {
      final responseData =
          await ApiService().deleteApi('${Urls.removeCartItemUrl}/$id');
      if (responseData != null) {
        customSuccessMessage(message: 'Cart Item Successfully Removed');
        cartItemList.removeWhere((element) => element.id == id);
        update();
      } else {
        customErrorMessage(message: 'Cart Item Remove Failed');
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }

  void incrementQuantity(int index) {
    if (cartItemList[index].quantity! <
        cartItemList[index].products!.alertQuantity!) {
      cartItemList[index].quantity = (cartItemList[index].quantity! + 1);
      update();
    }
  }

  void decrementQuantity(int index) {
    if (cartItemList[index].quantity! > 1) {
      cartItemList[index].quantity = (cartItemList[index].quantity! - 1);
      update();
    }
  }

  int calculateSubTotal() {
    double subTotal = 0.0;
    for (var item in cartItemList) {
      subTotal += item.products!.offerPrice != null
          ? item.quantity! * item.products!.offerPrice!
          : 0.0;
    }
    int roundSubTotal = subTotal.round();
    return roundSubTotal;
  }

  void clearCartItems() {
    cartItemList.clear(); // Clear the cartItemList
    update(); // Update the UI to reflect the empty cart
  }
}
