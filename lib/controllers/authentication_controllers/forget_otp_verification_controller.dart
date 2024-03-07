import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/otp_verification.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/set_password_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetOtpVerificationController extends GetxController{
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void formOnSubmit(String userId) async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update();
      final otpVerification = OtpVerification(
        userId: userId,
        otp: otpController.text.trim(),
      );
      bool verifyOtpSuccess = await forgetVerifyOtpRequest(otpVerification);
      if (verifyOtpSuccess == true) {
        navigateToSetPasswordScreen(userId);
      } else {
        customErrorMessage(message: 'Otp Verification Failed');
        isLoading = false;
        update();
      }
    }
  }

  void navigateToSetPasswordScreen(userId) {
    Get.offAll(() =>  SetPasswordScreen(userId: userId, otp: otpController.text.trim()));
    isLoading = false;
  }
}