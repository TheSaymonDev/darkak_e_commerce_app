import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/otp_verification.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ForgetOtpVerificationController extends GetxController {

  bool isLoading = false;

  Future<bool> formOnSubmit({required String userId, required String otp}) async {
      isLoading = true;
      update();
      final otpVerification = OtpVerification(
        userId: userId,
        otp: otp,
      );
      try {
        final responseData = await ApiService()
            .postApi(Urls.forgetOtpVerificationUrl, otpVerification);
        if (responseData != null && responseData != 404) {
          customSuccessMessage(message: 'Otp Successfully Verified');
          isLoading=false;
          update();
          return true;
        } else if (responseData == 404) {
          customErrorMessage(message: 'Invalid OTP');
          isLoading = false;
          update();
          return false;
        } else {
          customErrorMessage(message: 'Otp Verification Failed');
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
