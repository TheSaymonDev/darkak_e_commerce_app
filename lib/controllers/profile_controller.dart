import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/models/user.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  bool isNotification = false;
  User? user;

  void fetchProfile() async{
    final responseData = await ApiService().getApi('$baseUrl/users/current', requestHeaderWithToken);
    if(responseData != null){
      user = User.fromJson(responseData['user']);
    }else{
      customErrorMessage(message: 'Something Went Wrong');
    }
  }

  void toggleNotification(newValue) {
    isNotification = newValue;
    update();
  }
}
