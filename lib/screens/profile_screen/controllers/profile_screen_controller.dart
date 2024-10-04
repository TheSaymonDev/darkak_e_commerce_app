import 'package:darkak_e_commerce_app/screens/profile_screen/models/user_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isNotification = false;
  UserModel? user;
  bool isLoading = false;

  Future<void> getCurrentUser() async {
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUserUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        user = UserModel.fromJson(response.data['user']);
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }

  void toggleNotification(newValue) {
    isNotification = newValue;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final token = SharedPreferencesService().getToken();
    if (token.isNotEmpty) {
      getCurrentUser();
    }
  }
}
