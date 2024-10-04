import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/resend_otp_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:get/get.dart';

class OtpVerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerificationController());
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => ResendOTPController());
  }
}