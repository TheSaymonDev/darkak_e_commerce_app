import 'package:darkak_e_commerce_app/screens/address_view_screen/controller/address_view_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/model/address.dart';
import 'package:get/get.dart';

class StepAddressController extends GetxController{
  Address? readAddress;

  void getShippingAddress() {
    final addressList = Get.find<AddressViewController>().addressList;
    final shippingAddress = addressList.where((address) => address.shippingAddress == true).firstOrNull;
    if(shippingAddress != null){
      readAddress=shippingAddress;
    }else{
      readAddress = addressList.toList().asMap().entries.reduce((a, b) => a.value.createdAt!.compareTo(b.value.createdAt!) >= 0 ? a : b).value;
    }
  }


}