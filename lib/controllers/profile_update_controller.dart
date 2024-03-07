import 'dart:io';
import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/core/utils/shared_preferences.dart';
import 'package:darkak_e_commerce_app/models/user.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateController extends GetxController{
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final dateOfMarriageController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  File? image;
  bool isLoading = false;

  @override
  void onInit() async{
    super.onInit();
    _getUserData();
  }

  void formOnSubmit() async {
    isLoading = true;
    update();
    final user = User(image: image, name: nameController.text, dob: dateOfBirthController.text, marriageDate: dateOfMarriageController.text);
    bool profileUpdateSuccess = await profileUpdateRequest(SharedPreferencesService().getId(), user);
    if(profileUpdateSuccess==true){
      customSuccessMessage(message: 'Successfully Profile Update');
      _navigateToBack();
    }else{
      customErrorMessage(message: 'Something went wrong');
      isLoading = false;
      update();
    }
  }

  void _getUserData() async{
    nameController.text = SharedPreferencesService().getUserName();
    mobileNumberController.text = SharedPreferencesService().getMobile();
    passwordController.text = '********';
  }

  void _navigateToBack() {
    Get.off(()=> const HomeScreen());
    isLoading = false;
    update();
  }

  Future<File?> getImage() async {
    final getImage = ImagePicker();
    final pickedFile = await getImage.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
       image = File(pickedFile.path);
       update();
      return image; // Return the image file for further use
    } else {
      return null; // Handle cases where no image is picked
    }
  }

}