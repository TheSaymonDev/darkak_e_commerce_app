import 'package:darkak_e_commerce_app/screens/address_view_screen/model/address.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController{
  bool isLoading = false;
  List<Address> addressList = [];
  // Future<void> getAddressList() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService().getApi(AppUrls.addressUrl, header: headerWithToken);
  //     if (responseData != null) {
  //       List<dynamic> data = responseData;
  //       if (data.isNotEmpty) {
  //         addressList = data.map((item) => ReadAddressModel.fromJson(item)).toList();
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

  Future<void> getAddressList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.addressUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        List<dynamic> data = response.data;
        addressList = data.map((item) => Address.fromJson(item)).toList();
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

  // Future<void> removeAddress(String id) async {
  //   try {
  //     final responseData = await ApiService().deleteApi('${AppUrls.addressUrl}/$id');
  //     if (responseData != null && responseData != 500) {
  //       customSuccessMessage(message: 'Address Successfully Deleted');
  //       addressList.removeWhere((element) => element.id == id);
  //       update(); // Force UI update after removal from list
  //     } else if(responseData == 500){
  //       customErrorMessage(message: 'You Ordered To This Address');
  //     }else {
  //       customErrorMessage(message: 'Address Deletion Failed');
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //   }
  // }

  Future<void> removeAddress(String id)async{
    try {
      final response = await ApiService().delete(url: '${AppUrls.addressUrl}/$id', headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Successfully Deleted');
        addressList.removeWhere((element) => element.id == id);
        update(); // Force UI update after removal from list
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

  @override
  void onClose() {
    print('============== onclosed is called now');
   addressList.clear();
    super.onClose();
  }
}