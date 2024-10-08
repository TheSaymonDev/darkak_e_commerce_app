import 'package:darkak_e_commerce_app/screens/cart_screen/models/cart_item_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  bool isLoading = false;
  List<CartItemModel> cartItemsData = [];

  Future<void> getCartItem() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
   _setLoading(true);
    try {
      final response = await ApiService().get(url: AppUrls.getCartItemUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        cartItemsData = data.map((item) => CartItemModel.fromJson(item)).toList();
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

  Future<void> removeCartItem(String id)async{
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
    try {
      final response = await ApiService().delete(url: '${AppUrls.removeCartItemUrl}/$id', headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Cart Item Successfully Removed');
        cartItemsData.removeWhere((element) => element.id == id);
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
    if (cartItemsData[index].quantity! <
        cartItemsData[index].productsData!.alertQuantity!) {
      cartItemsData[index].quantity = (cartItemsData[index].quantity! + 1);
      update();
    }
  }

  void decrementQuantity(int index) {
    if (cartItemsData[index].quantity! > 1) {
      cartItemsData[index].quantity = (cartItemsData[index].quantity! - 1);
      update();
    }
  }

  int calculateSubTotal() {
    double subTotal = 0.0;
    for (var item in cartItemsData) {
      subTotal += item.productsData!.offerPrice != null
          ? item.quantity! * item.productsData!.offerPrice!
          : 0.0;
    }
    int roundSubTotal = subTotal.round();
    return roundSubTotal;
  }

  void clearCartItems() {
    cartItemsData.clear(); // Clear the cartItemList
    update(); // Update the UI to reflect the empty cart
  }

  @override
  void onInit() {
    super.onInit();
    final token = SharedPreferencesService().getToken();
    if(token.isNotEmpty){
      getCartItem();
    }
  }
}
