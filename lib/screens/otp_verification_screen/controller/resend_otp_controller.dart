import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/model/resend_otp.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';


class ResendOTPController extends GetxController{
  Future<void> resendOTP({required ResendOTP resendOTP}) async {
    try {
      print(resendOTP.userId);
      final response = await ApiService().post(
          url: AppUrls.resendOTPUrl, data: resendOTP);
      if (response.success) {
        customSuccessMessage(message: 'Resend OTP Your Mobile');
        // Reset timer duration
        Get.find<TimerController>().duration = const Duration(minutes: 2, seconds: 30);
        // Restart the timer
        Get.find<TimerController>().startTimer();
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
        customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }
}