import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/read_address_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController{
  bool isLoading = false;
  List<ReadAddressModel> addressList = [];
  Future<void> getAddressList() async {
    isLoading = true;
    update();
    try {
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService().getApi(Urls.addressUrl, header: headerWithToken);
      if (responseData != null) {
        List<dynamic> data = responseData;
        if (data.isNotEmpty) {
          addressList = data.map((item) => ReadAddressModel.fromJson(item)).toList();
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

  Future<void> removeAddress(String id) async {
    try {
      final responseData = await ApiService().deleteApi('${Urls.addressUrl}/$id');
      if (responseData != null && responseData != 500) {
        customSuccessMessage(message: 'Address Successfully Deleted');
        addressList.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
      } else if(responseData == 500){
        customErrorMessage(message: 'You Ordered To This Address');
      }else {
        customErrorMessage(message: 'Address Deletion Failed');
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }

  @override
  void onClose() {
    print('============== onclosed is called now');
   addressList.clear();
    super.onClose();
  }
}