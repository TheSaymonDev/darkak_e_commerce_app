import 'package:darkak_e_commerce_app/screens/address_view_screen/models/address_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  bool isLoading = false;
  List<AddressModel> addressListData = [];

  Future<void> getAddressList() async {
    _setLoading(false);
    try {
      final response = await ApiService()
          .get(url: AppUrls.addressUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        addressListData =
            data.map((item) => AddressModel.fromJson(item)).toList();
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address loaded failed';
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

  Future<void> removeAddress(String id) async {
    try {
      final response = await ApiService().delete(
          url: '${AppUrls.addressUrl}/$id',
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Successfully Deleted');
        addressListData.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
      } else {
        final errorMessage =
            response.message['message'] ?? 'Cart Item Remove Failed';
        customErrorMessage(message: errorMessage);
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    final token = SharedPreferencesService().getToken();
    if(token.isNotEmpty){
      getAddressList();
    }
  }

}
