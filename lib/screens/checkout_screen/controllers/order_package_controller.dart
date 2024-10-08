import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/models/order_package_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class OrderPackageController extends GetxController{
  List<OrderPackageModel> packages = [];
  OrderPackageModel? orderPackage;

  int? deliveryCharge;
  String? packageCode;

  Future<void> getPackageList() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
    try {
      final response = await ApiService().get(url: AppUrls.orderPackageUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        packages = data.map((item) => OrderPackageModel.fromJson(item)).toList();
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      update();
    }
  }

  void  getPackageData(){
    if(Get.find<StepAddressController>().readAddress!.city == 'Dhaka'){
      final insideD = packages.where((package) => package.coverage == 'Inside Dhaka').toList();
      orderPackage  = insideD.where((element) => element.shippingCharge == 90).firstOrNull;
      deliveryCharge = orderPackage!.shippingCharge;
      packageCode = orderPackage!.packageCode;
    }else{
      final outsideD = packages.where((package) => package.coverage == 'Outside Dhaka').toList();
      orderPackage  = outsideD.where((element) => element.shippingCharge == 120).firstOrNull;
      deliveryCharge = orderPackage!.shippingCharge;
      packageCode = orderPackage!.packageCode;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPackageList();
  }

}