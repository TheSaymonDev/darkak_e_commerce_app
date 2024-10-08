import 'package:darkak_e_commerce_app/screens/set_password_screen/models/set_password_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  late String userId;
  late String otp;
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  Future<bool> setNewPassword(
      {required SetPasswordModel setPasswordData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService()
          .post(url: AppUrls.setPasswordUrl, data: setPasswordData);
      if (response.success) {
        customSuccessMessage(message: 'Password Changed Successfully');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Password Change Failed';
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments['userId'] as String;
    otp = Get.arguments['otp'] as String;
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
