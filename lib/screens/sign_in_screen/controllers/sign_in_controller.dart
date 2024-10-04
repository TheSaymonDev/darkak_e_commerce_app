import 'package:darkak_e_commerce_app/screens/sign_in_screen/models/sign_in_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;

  final formKey = GlobalKey<FormState>();
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> signInUser({required SignInModel signInData}) async {
    _setLoading(true);
    try {
      final response =
          await ApiService().post(url: AppUrls.signInUrl, data: signInData);
      if (response.success) {
        SharedPreferencesService().saveToken(response.data['accessToken']);
        customSuccessMessage(message: 'Successfully Log In');
        _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
