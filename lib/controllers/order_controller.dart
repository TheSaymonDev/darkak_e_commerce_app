import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_order_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  bool isLoading = false;
  Future<bool> createOrder({required OrderModel orderModel}) async {
    isLoading = true;
    update();
    try {
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService()
          .postApi(Urls.createOrderUrl, orderModel, header: headerWithToken);
      if (responseData != null && responseData != 404) {
        customSuccessMessage(message: 'Successfully Order');
        isLoading = false;
        update();
        return true;
      } else if (responseData == 404) {
        customErrorMessage(message: 'Product Stock Out');
        isLoading = false;
        update();
        return false;
      } else {
        customErrorMessage(message: 'Something went wrong');
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }
}
