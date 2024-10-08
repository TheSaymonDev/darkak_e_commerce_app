import 'package:darkak_e_commerce_app/screens/sign_up_screen/models/sign_up_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isObscure = true;
  String? userId;
  bool isLoading = false;

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> signUpUser({required SignUpModel signUpData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response =
          await ApiService().post(url: AppUrls.signUpUrl, data: signUpData);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        userId = response.data['user']['id'];
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Registration Failed';
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
