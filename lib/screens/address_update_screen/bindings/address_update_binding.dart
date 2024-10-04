import 'package:darkak_e_commerce_app/screens/address_update_screen/controllers/address_update_controller.dart';
import 'package:get/get.dart';

class AddressUpdateBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AddressUpdateController());
  }
}