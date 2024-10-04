import 'package:darkak_e_commerce_app/screens/address_view_screen/controllers/address_view_controller.dart';
import 'package:get/get.dart';

class AddressViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddressViewController());
  }
}