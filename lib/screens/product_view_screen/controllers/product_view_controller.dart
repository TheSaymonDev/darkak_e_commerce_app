import 'package:darkak_e_commerce_app/screens/shop_screen/models/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewController extends GetxController{

  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late String imagePath;
  late List<Images> imagesPath;

  @override
  void onInit() {
    super.onInit();
    imagePath = Get.arguments['imagePath'] as String;
    imagesPath = Get.arguments['imagesPath'] as List<Images>;
    controller = TransformationController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}