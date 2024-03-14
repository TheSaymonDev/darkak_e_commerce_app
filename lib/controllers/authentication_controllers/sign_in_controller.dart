import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_in.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  void formOnSubmit() async {
      if (formKey.currentState?.validate() ?? false) {
        isLoading = true;
        update();
        final signIn = SignIn(
          identity: identifierController.text.trim(),
          password: passwordController.text.trim(),
        );
        try{
          final responseData = await ApiService().postApi(Urls.signInUrl, signIn);
          if (responseData != null) {
            SharedPreferencesService().saveToken(responseData['accessToken']);
            customSuccessMessage(message: 'Successfully Log In');
            navigateToHomeScreen();
          } else {
            customErrorMessage(message: 'Log In Failed');
            isLoading = false;
            update();
          }
        }catch(error){
          customErrorMessage(message: error.toString());
          isLoading = false;
          update();
        }
      }
    }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void navigateToHomeScreen(){
    Get.offAll(()=> const HomeScreen());
    isLoading=false;
    identifierController.clear();
    passwordController.clear();
  }
}
