import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/models/otp_verification_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool isLoading = false;

  late bool isForgetOTP;
  late String userId;
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> verifyOTP(
      {required OtpVerificationModel otpVerificationData,
      required String url}) async {
    _setLoading(true);
    try {
      final response =
          await ApiService().post(url: url, data: otpVerificationData);
      if (response.success) {
        customSuccessMessage(message: 'Otp Successfully Verified');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'OTP Verification Failed';
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

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    isForgetOTP = Get.arguments['isForgetOTP'] as bool;
    userId = Get.arguments['userId'] as String;
    Get.find<TimerController>().startTimer();
  }

  @override
  void dispose() {
    Get.find<TimerController>().timer.cancel();
    super.dispose();
  }
}
