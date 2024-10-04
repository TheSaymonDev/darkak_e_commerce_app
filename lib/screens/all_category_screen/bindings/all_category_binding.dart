import 'package:darkak_e_commerce_app/screens/all_category_screen/controllers/category_wised_product_list_controller.dart';
import 'package:get/get.dart';

class AllCategoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryWisedProductListController());
  }
}