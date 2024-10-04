import 'package:darkak_e_commerce_app/screens/address_create_screen/models/create_address_model.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/models/address_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressUpdateController extends GetxController {
  bool shippingAddress = true;
  bool isLoading = false;

  late AddressModel? shippingAddressData;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String id;

  Future<bool> updateAddress({required String id, required CreateAddressModel updateAddressData}) async {
    _setLoading(true);
    try {
      final response = await ApiService().patch(
          url:  '${AppUrls.addressUrl}/$id', data: updateAddressData, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Address Updated');
       _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Address Update Failed';
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

  @override
  void onInit() {
    super.onInit();
    shippingAddressData = Get.arguments['shippingAddressData'] as AddressModel;
    if (shippingAddressData != null) {
      nameController.text = shippingAddressData!.fullName ?? '';
      mobileController.text = shippingAddressData!.mobile ?? '';
      addressController.text = shippingAddressData!.address ?? '';
      areaController.text = shippingAddressData!.area ?? '';
      cityController.text = shippingAddressData!.city ?? '';
      thanaController.text = shippingAddressData!.thana ?? '';
      zipCodeController.text = shippingAddressData!.zip ?? '';
      stateController.text = shippingAddressData!.state ?? '';
      shippingAddress = shippingAddressData!.shippingAddress!;
      id = shippingAddressData!.id!;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    thanaController.dispose();
    cityController.dispose();
    areaController.dispose();
    addressController.dispose();
    super.dispose();
  }


}
