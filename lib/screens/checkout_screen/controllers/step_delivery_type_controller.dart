import 'package:darkak_e_commerce_app/screens/checkout_screen/models/delivery_option_model.dart';
import 'package:get/get.dart';

class StepDeliveryTypeController extends GetxController{
  DeliveryOptionModel? selectedOption;

  void deliveryTypeOnChanged(value){
    selectedOption = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    deliveryTypeOnChanged(DeliveryOptionModel.deliveryOptionList[0]);
  }
}