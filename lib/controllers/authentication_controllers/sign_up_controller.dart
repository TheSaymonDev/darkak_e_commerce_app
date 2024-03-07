import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_up.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isObscure = true;
  String? userId;
  bool isLoading = false;
  void formOnSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update();
      final signUp = SignUp(
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      userId = await registrationRequest(signUp);
      if (userId != null) {
        customSuccessMessage(message: 'Sent Otp Your Mobile');
        navigateToOtpVerificationScreen();
      } else {
        customErrorMessage(message: 'Registration Failed');
          isLoading = false;
          update();
      }
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void navigateToOtpVerificationScreen(){
    Get.offAll(()=> OtpVerificationScreen(
      userId: userId,
    ));
    isLoading = false;
    emailController.clear();
    mobileController.clear();
    nameController.clear();
    passwordController.clear();
  }
}
