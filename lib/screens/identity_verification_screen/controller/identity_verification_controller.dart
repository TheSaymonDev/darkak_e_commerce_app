import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class IdentityVerificationController extends GetxController {

  String? userId;
  bool isLoading = false;

  Future<bool> identityVerify({required IdentityVerification identityVerification}) async {
    isLoading = true;
    update();
    try {
      print(identityVerification.identity);
      final response = await ApiService().post(
          url: AppUrls.identityUrl, data: identityVerification);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        userId = response.data['userId'];
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
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
