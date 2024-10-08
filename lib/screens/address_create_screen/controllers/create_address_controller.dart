import 'package:darkak_e_commerce_app/screens/address_create_screen/models/create_address_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAddressController extends GetxController {
  bool shippingAddress = true;
  bool isLoading = false;

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> addAddress({required CreateAddressModel createAddressData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return false;
    }
   _setLoading(true);
    try {
      final response = await ApiService().post(
          url: AppUrls.addressUrl, data: createAddressData, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Address Added');
       _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Something went wrong';
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

  void toggleShippingAddress(value) {
   shippingAddress=value;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

}
