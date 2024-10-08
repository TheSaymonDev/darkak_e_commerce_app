import 'package:darkak_e_commerce_app/screens/identity_verification_screen/models/identity_verification_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityVerificationController extends GetxController {
  String? userId;
  bool isLoading = false;
  final identifierController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> identityVerify(
      {required IdentityVerificationModel identityVerificationData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService()
          .post(url: AppUrls.identityUrl, data: identityVerificationData);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        userId = response.data['userId'];
        _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
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
}
