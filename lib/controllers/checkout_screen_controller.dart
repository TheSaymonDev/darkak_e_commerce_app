import 'package:darkak_e_commerce_app/models/delivery_option_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreenController extends GetxController{
  DeliveryOptions? selectedOption;
  void deliveryTypeOnChanged(value){
    selectedOption = value;
    update();
  }

  final formKey = GlobalKey<FormState>();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedSubDistrict;
  final zipCodeController = TextEditingController();

  String? finalAddress;
}