import 'dart:io';
import 'package:darkak_e_commerce_app/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/models/user_model.dart';
import 'package:darkak_e_commerce_app/screens/profile_update_screen/model/profile_update_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_const_functions.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateController extends GetxController {
  bool isLoading = false;
  File? imageFile;
  late UserModel userData;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final dateOfMarriageController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  late String? imgUrl;
  late String id;

  Future<void> getImageFromGallery() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      } else {
        customErrorMessage(message: 'No image selected.');
      }
      update();
    } catch (error) {
      customErrorMessage(message: 'Failed to pick image.');
    }
  }

  Future<bool> updateProfile({
    required String id,
   required ProfileUpdateModel profileUpdateData
  }) async {
   _setLoading(true);
    final data = {
      'name': profileUpdateData.name,
      'dob': profileUpdateData.dob,
      'marriageDate': profileUpdateData.marriageDate,
    };
    try {
      final response = await ApiService().patchMultipart(
        url: '${AppUrls.profileUpdateUrl}/$id',
        data: data,
        file: imageFile,
        headers: AppUrls.getHeaderWithToken,
      );
      if (response.success) {
        customSuccessMessage(message: 'Profile Successfully Updated');
       _setLoading(false);
        Get.find<ProfileController>().getCurrentUser();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
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

  @override
  void onInit() {
    super.onInit();
    userData = Get.arguments['userData'] as UserModel;
    nameController.text = userData.name!;
    mobileNumberController.text = userData.mobile!;
    passwordController.text = '***********';
    if (userData.dob!= null) {
      dateOfBirthController.text = AppConstFunctions.formatDate(userData.dob!);
    } else {
      dateOfBirthController.clear();
    }
    if (userData.marriageDate != null) {
      dateOfMarriageController.text = AppConstFunctions.formatDate(userData.marriageDate!);
    } else {
      dateOfMarriageController.clear();
    }
    if(userData.profileImage != null){
      imgUrl = userData.profileImage!.path;
    }else{
      imgUrl = null;
    }
    id = userData.id!;
  }

}
