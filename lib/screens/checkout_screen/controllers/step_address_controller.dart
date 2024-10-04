import 'package:darkak_e_commerce_app/screens/address_view_screen/controllers/address_view_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepAddressController extends GetxController{
  AddressModel? readAddress;

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();

  void getShippingAddress() {
    final addressList = Get.find<AddressViewController>().addressListData;
    final shippingAddress = addressList.where((address) => address.shippingAddress == true).firstOrNull;
    if(shippingAddress != null){
      readAddress=shippingAddress;
    }else{
      readAddress = addressList.toList().asMap().entries.reduce((a, b) => a.value.createdAt!.compareTo(b.value.createdAt!) >= 0 ? a : b).value;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getShippingAddress();
    nameController.text = readAddress!.fullName!;
    mobileController.text = readAddress!.mobile!;
    addressController.text = readAddress!.address!;
    areaController.text = readAddress!.area!;
    cityController.text = readAddress!.city!;
    thanaController.text = readAddress!.thana!;
    zipCodeController.text = readAddress!.zip!;
    stateController.text = readAddress!.state!;
  }

}