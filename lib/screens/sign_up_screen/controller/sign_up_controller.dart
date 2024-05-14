import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/model/sign_up.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  bool isObscure = true;
  String? userId;
  bool isLoading = false;

  Future<bool> signUpUser({required SignUp signUp}) async {
    isLoading = true;
    update();
    try {
      print(signUp.name);
      print(signUp.mobile);
      print(signUp.password);
      print(signUp.email);
      final response = await ApiService().post(
          url: AppUrls.signUpUrl, data: signUp);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        userId = response.data['user']['id'];
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Registration Failed';
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

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }
}
