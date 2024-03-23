import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_in.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;

  Future<bool> formOnSubmit({required String identity, required String password}) async {
      isLoading = true;
      update();
      final signIn = SignIn(
        identity: identity,
        password: password,
      );
      try {
        final responseData = await ApiService().postApi(Urls.signInUrl, signIn);
        if (responseData != null && responseData != 404) {
          SharedPreferencesService().saveToken(responseData['accessToken']);
          customSuccessMessage(message: 'Successfully Log In');
          isLoading=false;
          update();
          return true;
        } else if (responseData == 404) {
          customErrorMessage(message: 'Invalid User Name Or Password');
          isLoading = false;
          update();
          return false;
        } else {
          customErrorMessage(message: 'Log In Failed');
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
