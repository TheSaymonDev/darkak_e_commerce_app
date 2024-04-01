import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_my_order.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  bool isLoading = false;
  List<MyOrder> myOrderList = [];
  Future<void> getMyOrderList() async {
    isLoading = true;
    update();
    try {
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService()
          .getApi(Urls.getMyOrderUrl, header: headerWithToken);
      if (responseData != null) {
        List<dynamic> data = responseData;
        if (data.isNotEmpty) {
          myOrderList = data.map((item) => MyOrder.fromJson(item)).toList();
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
}
