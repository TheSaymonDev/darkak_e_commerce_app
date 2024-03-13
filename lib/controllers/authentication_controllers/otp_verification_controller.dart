import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
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
    try{
      if (formKey.currentState?.validate() ?? false) {
        isLoading = true;
        update();
        final otpVerification = OtpVerification(
          userId: userId,
          otp: otpController.text.trim(),
        );
        final responseData = await ApiService().postApi('$baseUrl/users/otp-verify', otpVerification);
        if (responseData != null) {
          customSuccessMessage(message: 'Otp Successfully Verified');
          SharedPreferencesService().saveToken(responseData['accessToken']);
          navigateToHomeScreen();
        } else {
          customErrorMessage(message: 'Otp Verification Failed');
          isLoading = false;
          update();
        }
      }
    }catch(error){
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  void navigateToHomeScreen() {
    Get.offAll(() => const HomeScreen());
    isLoading = false;
    otpController.clear();
  }
}
