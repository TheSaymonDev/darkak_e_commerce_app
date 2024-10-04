import 'package:darkak_e_commerce_app/screens/address_create_screen/controllers/create_address_controller.dart';
import 'package:get/get.dart';

class AddressCreateBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAddressController());
  }
}