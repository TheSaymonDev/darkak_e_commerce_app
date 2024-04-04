import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/create_address_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';


class AddressUpdateController extends GetxController {
  bool shippingAddress = true;
  bool isLoading = false;
  Future<bool> formOnSubmit({required String id, required CreateAddressModel updateAddressModel}) async {
    isLoading = true;
    update();
    try {
      String token = SharedPreferencesService().getToken();
      Map<String, String> headerWithToken = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final responseData = await ApiService().patchApi(
          '${Urls.addressUrl}/$id',
          updateAddressModel,
          header: headerWithToken);
      if (responseData != null && responseData != 404) {
        customSuccessMessage(message: 'Successfully Address Updated');
        isLoading = false;
        update();
        return true;
      } else if (responseData == 404) {
        customErrorMessage(message: 'Already Address Updated');
        isLoading = false;
        update();
        return false;
      } else {
        customErrorMessage(message: 'Something Went Wrong');
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
