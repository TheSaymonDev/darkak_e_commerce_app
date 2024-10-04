import 'package:darkak_e_commerce_app/screens/cart_screen/models/cart_item_model.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/models/create_order_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CreateOrderController extends GetxController {
  bool isLoading = false;
  // Future<bool> createOrder({required CreateOrder orderModel}) async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService()
  //         .postApi(AppUrls.createOrderUrl, orderModel, header: headerWithToken);
  //     if (responseData != null && responseData != 404) {
  //       customSuccessMessage(message: 'Successfully Order');
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else if (responseData == 404) {
  //       customErrorMessage(message: 'Product Stock Out');
  //       isLoading = false;
  //       update();
  //       return false;
  //     } else {
  //       customErrorMessage(message: 'Something went wrong');
  //       isLoading = false;
  //       update();
  //       return false;
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     isLoading = false;
  //     update();
  //     return false;
  //   }
  // }

  Future<bool> createOrder({required CreateOrderModel orderModel}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.createOrderUrl, data: orderModel, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Order');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Order Failed';
        customErrorMessage(message: errorMessage);
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

  late List<CartItemModel> cartItemList;
  late int totalAmount;

  @override
  void onInit() {
    super.onInit();
    cartItemList = Get.arguments['cartItemList'] as List<CartItemModel>;
    totalAmount = Get.arguments['totalAmount'] as int;
  }

}