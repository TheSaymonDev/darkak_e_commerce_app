import 'package:darkak_e_commerce_app/models/final_delivery_option_model.dart';
import 'package:darkak_e_commerce_app/models/read_address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreenController extends GetxController{
  DeliveryOptions? selectedOption;
  void deliveryTypeOnChanged(value){
    selectedOption = value;
    update();
  }

  ReadAddressModel? readAddressModel;
  String? addressId;
  final formKey = GlobalKey<FormState>();
  String? finalAddress;
}