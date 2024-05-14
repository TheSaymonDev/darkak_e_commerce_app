import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/model/sign_in.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;

  Future<bool> signInUser({required SignIn signIn}) async {
    isLoading = true;
    update();
    try {
      print(signIn.password);
      print(signIn.identity);
      final response = await ApiService().post(
          url: AppUrls.signInUrl, data: signIn);
      if (response.success) {
        SharedPreferencesService().saveToken(response.data['accessToken']);
        customSuccessMessage(message: 'Successfully Log In');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
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
