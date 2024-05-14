import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/address_management_screen/model/create_address_model.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CreateAddressController extends GetxController {
  bool shippingAddress = true;
  bool isLoading = false;
  // Future<bool> formOnSubmit({required CreateAddressModel createAddressModel}) async {
  //   isLoading = true;
  //   update();
  //   try {
  //     String token = SharedPreferencesService().getToken();
  //     Map<String, String> headerWithToken = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     final responseData = await ApiService().postApi(
  //         AppUrls.addressUrl, createAddressModel,
  //         header: headerWithToken);
  //     if (responseData != null && responseData != 404) {
  //       customSuccessMessage(message: 'Successfully Address Added');
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else if (responseData == 404) {
  //       customErrorMessage(message: 'Already Address Added');
  //       isLoading = false;
  //       update();
  //       return false;
  //     } else {
  //       customErrorMessage(message: 'Something Went Wrong');
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

  Future<bool> addAddress({required CreateAddress createAddress}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.addressUrl, data: createAddress, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Address Added');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Something went wrong';
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

  void toggleShippingAddress(value) {
   shippingAddress=value;
    update();
  }
}
