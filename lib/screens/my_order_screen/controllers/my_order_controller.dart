import 'package:darkak_e_commerce_app/screens/my_order_screen/models/my_order_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  bool isLoading = false;
  List<MyOrderModel> myOrderListData = [];

  Future<void> getMyOrderList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getMyOrderUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        myOrderListData = data.map((item) => MyOrderModel.fromJson(item)).toList();
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
