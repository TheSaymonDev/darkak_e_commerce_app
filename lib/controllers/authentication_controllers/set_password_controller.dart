import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/set_password.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController{

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  formOnSubmit(String userId, String otp) async{
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update();
     final setPassword = SetPassword(userId: userId, password: newPasswordController.text.trim(), otp: otp);
      bool setPasswordSuccess = await setPasswordRequest(setPassword);
      if (setPasswordSuccess == true) {
        customSuccessMessage(message: 'Password Changed Successfully');
        navigateToSignInScreen();
      } else {
        customErrorMessage(message: 'Failed to change password');
        isLoading = false;
        update();
      }
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

  void navigateToSignInScreen() {
    Get.offAll(()=>SignInScreen());
    isLoading=false;
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}