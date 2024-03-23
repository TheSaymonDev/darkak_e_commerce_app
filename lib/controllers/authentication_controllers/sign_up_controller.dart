import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_up.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  bool isObscure = true;
  String? userId;
  bool isLoading = false;
  Future<bool> formOnSubmit({required String email, required String mobile, required String name, required String password}) async {
      isLoading = true;
      update();
      final signUp = SignUp(
        email: email,
        mobile: mobile,
        name: name,
        password: password,
      );
      try {
        final responseData = await ApiService().postApi(Urls.signUpUrl, signUp);
        if (responseData != null && responseData != 404) {
          customSuccessMessage(message: 'Sent Otp Your Mobile');
          userId = responseData['user']['id'];
          isLoading=false;
          update();
          return true;
        }else if (responseData == 404) {
          customErrorMessage(message: 'User Already Exist');
          isLoading = false;
          update();
          return false;
        }
        else {
          customErrorMessage(message: 'Registration Failed');
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
