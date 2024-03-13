import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
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
    try{
      if (formKey.currentState?.validate() ?? false) {
        isLoading = true;
        update();
        final signUp = SignUp(
          email: emailController.text.trim(),
          mobile: mobileController.text.trim(),
          name: nameController.text.trim(),
          password: passwordController.text.trim(),
        );
        final responseData = await ApiService().postApi('$baseUrl/users', signUp);
        if (responseData != null) {
          customSuccessMessage(message: 'Sent Otp Your Mobile');
          userId = responseData['user']['id'];
          navigateToOtpVerificationScreen();
        } else {
          customErrorMessage(message: 'Registration Failed');
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

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void navigateToOtpVerificationScreen() {
    Get.offAll(() => OtpVerificationScreen(
          userId: userId,
        ));
    isLoading = false;
    emailController.clear();
    mobileController.clear();
    nameController.clear();
    passwordController.clear();
  }
}
