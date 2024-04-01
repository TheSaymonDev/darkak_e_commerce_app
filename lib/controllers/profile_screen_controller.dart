import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_user.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  bool isNotification = false;
  User? user;
  bool isLoading = false;

  Future<void> getCurrentUser() async{
    isLoading=true;
    update();
   try{
     String token = SharedPreferencesService().getToken();
     Map<String, String> headerWithToken = {
       "Content-Type": "application/json",
       "Authorization": "Bearer $token"
     };
     final responseData = await ApiService().getApi(Urls.getCurrentUserUrl, header: headerWithToken);
     if(responseData != null){
       user = User.fromJson(responseData['user']);
       isLoading=false;
       update();
     }else{
       customErrorMessage(message: 'Something Went Wrong');
       isLoading=false;
       update();
     }
   }catch (error) {
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
