import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/model/user.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  bool isNotification = false;
  User? user;
  bool isLoading = false;

  // Future<void> getCurrentUser() async{
  //   isLoading=true;
  //   update();
  //  try{
  //    String token = SharedPreferencesService().getToken();
  //    Map<String, String> headerWithToken = {
  //      "Content-Type": "application/json",
  //      "Authorization": "Bearer $token"
  //    };
  //    final responseData = await ApiService().getApi(AppUrls.getCurrentUserUrl, header: headerWithToken);
  //    if(responseData != null){
  //      user = User.fromJson(responseData['user']);
  //      isLoading=false;
  //      update();
  //    }else{
  //      customErrorMessage(message: 'Something Went Wrong');
  //      isLoading=false;
  //      update();
  //    }
  //  }catch (error) {
  //    customErrorMessage(message: error.toString());
  //    isLoading = false;
  //    update();
  //  }
  // }

  Future<void> getCurrentUser() async{
    isLoading=true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getCurrentUserUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        user = User.fromJson(response.data['user']);
        isLoading=false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  void toggleNotification(newValue) {
    isNotification = newValue;
    update();
  }

}
