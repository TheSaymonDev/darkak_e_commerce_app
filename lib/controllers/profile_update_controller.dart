import 'dart:io';
import 'package:darkak_e_commerce_app/controllers/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateController extends GetxController {
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

  Future<bool> formOnSubmit({required String id, required String name, required String dob, required String marriageDate}) async {
      isLoading = true;
      update();
      try{
        bool responseSuccess = await ApiService().patchMultiPartApi(
          '${Urls.profileUpdateUrl}/$id',
          {
            'name': name,
            'dob': dob,
            'marriageDate': marriageDate,
          },
          file: image,
        );
        if (responseSuccess==true) {
          customSuccessMessage(message: 'Profile Successfully Updated');
          Get.find<ProfileController>().getCurrentUser();
          isLoading=false;
          update();
          return true;
        } else {
          customErrorMessage(message: 'Something Went Wrong');
          isLoading = false;
          update();
          return false;
        }
      }catch(error){
        customErrorMessage(message: error.toString());
        isLoading = false;
        update();
        return false;
      }

  }
}
