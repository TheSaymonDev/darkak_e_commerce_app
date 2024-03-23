import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/set_password.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {

  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  Future<bool> formOnSubmit({required String userId, required String otp, required String password}) async {

      isLoading = true;
      update();
      final setPassword = SetPassword(
          userId: userId,
          password: password,
          otp: otp);
      try {
        final responseData =
            await ApiService().postApi(Urls.setPasswordUrl, setPassword);
        if (responseData != null && responseData != 404) {
          customSuccessMessage(message: 'Password Changed Successfully');
          return true;
        } else if (responseData == 404) {
          customErrorMessage(message: 'Verification Failed');
          isLoading = false;
          update();
          return false;
        } else {
          customErrorMessage(message: 'Failed to Change Password');
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }
}
