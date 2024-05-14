import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/model/set_password.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {

  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  Future<bool> setNewPassword({required SetPassword setPassword}) async {
    isLoading = true;
    update();
    try {
      print(setPassword.password);
      print(setPassword.userId);
      print(setPassword.otp);
      final response = await ApiService().post(
          url: AppUrls.setPasswordUrl, data: setPassword);
      if (response.success) {
        customSuccessMessage(message: 'Password Changed Successfully');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Password Change Failed';
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }
}
