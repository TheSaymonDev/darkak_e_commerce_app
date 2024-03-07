import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/identity_verification.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/forgot_otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityVerificationController extends GetxController {

  final identifierController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? userId;
  bool isLoading = false;

  void formOnSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update();
      final identityVerification =
          IdentityVerification(identity: identifierController.text.trim());
      userId = await verifyIdentifierRequest(identityVerification);
      if (userId != null) {
        customSuccessMessage(message: 'Sent Otp Your Mobile');
        navigateToForgetOtpVerification();
      } else {
        customErrorMessage(message: 'Verification Failed');
        isLoading = false;
        update();
      }
    }
  }

  void navigateToForgetOtpVerification() {
    Get.offAll(()=>ForgotOtpVerificationScreen(
      userId: userId,
    ));
    isLoading = false;
    identifierController.clear();
  }
}
