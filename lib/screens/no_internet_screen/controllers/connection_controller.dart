import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  bool isLoading = false;

  Future<void> checkConnection() async {
    _setLoading(true);
    final bool hasInternet = await ConnectivityService.isConnected();
    if (hasInternet) {
      final token = SharedPreferencesService().getToken();
      if (token.isNotEmpty) {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Get.offAllNamed(AppRoutes.onboardingScreen);
      }
      _setLoading(false);
    } else {
      customErrorMessage(
          message: 'Still no internet connection. Please try again.');
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
