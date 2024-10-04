import 'package:darkak_e_commerce_app/screens/all_brand_screen/controllers/brand_wised_product_controller.dart';
import 'package:get/get.dart';

class AllBrandBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BrandWisedProductListController(),);
  }
}