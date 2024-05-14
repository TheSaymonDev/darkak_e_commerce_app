import 'package:darkak_e_commerce_app/screens/checkout_screens/model/delivery_option.dart';
import 'package:get/get.dart';

class StepDeliveryTypeController extends GetxController{
  DeliveryOption? selectedOption;

  void deliveryTypeOnChanged(value){
    selectedOption = value;
    update();
  }
}