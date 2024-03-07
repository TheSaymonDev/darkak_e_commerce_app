import 'package:darkak_e_commerce_app/core/utils/shared_preferences.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  String? name;
  String? email;
  bool isNotification = false;

  @override
  void onInit() {
    super.onInit();
    name = SharedPreferencesService().getUserName();
    email = SharedPreferencesService().getEmail();
  }

  void toggleNotification(newValue) {
    isNotification = newValue;
    update();
  }
}
