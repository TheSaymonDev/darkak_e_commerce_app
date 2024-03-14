import 'dart:io';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final dateOfMarriageController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  File? image;
  Future<void> getImageFromGallery() async {
    try {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      }
    } on PlatformException catch (e) {
      customErrorMessage(message: e); // Handle platform exceptions
    }
  }

  void formOnSubmit(String? id) async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update();
      try{
        bool responseSuccess = await ApiService().patchMultiPartApi(
          '${Urls.profileUpdateUrl}/$id',
          {
            'name': nameController.text,
            'dob': dateOfBirthController.text,
            'marriageDate': dateOfMarriageController.text,
          },
          file: image,
        );
        if (responseSuccess==true) {
          customSuccessMessage(message: 'Profile Successfully Updated');
          _navigateToBack();
        } else {
          customErrorMessage(message: 'Something Went Wrong');
          isLoading = false;
          update();
        }
      }catch(error){
        customErrorMessage(message: error.toString());
        isLoading = false;
        update();
      }
    }
  }

  void _navigateToBack() {
    isLoading = false;
    update();
    Get.off(() => const HomeScreen());
  }
}
