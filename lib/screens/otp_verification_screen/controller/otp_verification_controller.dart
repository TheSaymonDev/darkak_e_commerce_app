import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {

  bool isLoading = false;

  Future<bool> verifyOTP({required OtpVerification otpVerification, required String url}) async {
    isLoading = true;
    update();
    try {
      print(otpVerification.userId);
      print(otpVerification.otp);
      final response = await ApiService().post(
          url: url, data: otpVerification);
      if (response.success) {
        customSuccessMessage(message: 'Otp Successfully Verified');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Verification Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }
}
