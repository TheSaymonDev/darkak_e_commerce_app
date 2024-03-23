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
}