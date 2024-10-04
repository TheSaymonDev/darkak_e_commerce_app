import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/create_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_delivery_type_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CreateOrderController());
    Get.put(StepDeliveryTypeController());
    Get.put(StepAddressController());
  }
}