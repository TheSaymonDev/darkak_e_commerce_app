import 'package:darkak_e_commerce_app/screens/my_order_screen/model/my_order.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  bool isLoading = false;
  List<MyOrder> myOrderList = [];
  // Future<void> getMyOrderList() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService().getApi(AppUrls.getMyOrderUrl, header: headerWithToken);
  //     if (responseData != null) {
  //       List<dynamic> data = responseData;
  //       if (data.isNotEmpty) {
  //         myOrderList = data.map((item) => MyOrder.fromJson(item)).toList();
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

  Future<void> getMyOrderList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getMyOrderUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        myOrderList = data.map((item) => MyOrder.fromJson(item)).toList();
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
}
