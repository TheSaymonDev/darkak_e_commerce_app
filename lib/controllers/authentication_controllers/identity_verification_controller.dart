import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/identity_verification.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class IdentityVerificationController extends GetxController {

  String? userId;
  bool isLoading = false;

  Future<bool> formOnSubmit({required String identity}) async {
      isLoading = true;
      update();
      final identityVerification =
          IdentityVerification(identity: identity);
      try {
        final responseData =
            await ApiService().postApi(Urls.identityUrl, identityVerification);
        if (responseData != null && responseData != 404) {
          userId = responseData['userId'];
          customSuccessMessage(message: 'Sent Otp Your Mobile');
          return true;
        } else if (responseData == 404) {
          customErrorMessage(message: 'User Not Found');
          isLoading = false;
          update();
          return false;
        } else {
          customErrorMessage(message: 'Verification Failed');
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
