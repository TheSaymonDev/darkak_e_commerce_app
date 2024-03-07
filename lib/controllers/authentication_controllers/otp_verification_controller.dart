import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/otp_verification.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {

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
      bool verifyOtpSuccess = await verifyOtpRequest(otpVerification);
      if (verifyOtpSuccess == true) {
        navigateToHomeScreen();
      } else {
        customErrorMessage(message: 'Otp Verification Failed');
        isLoading = false;
        update();
      }
    }
  }

  void navigateToHomeScreen() {
    Get.offAll(() => const HomeScreen());
    isLoading = false;
    otpController.clear();
  }
}
