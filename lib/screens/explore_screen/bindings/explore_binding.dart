import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/brand_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/category_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/explore_screen_controller.dart';
import 'package:get/get.dart';

class ExploreBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ExploreScreenController());
    Get.put(CategoryListController());
    Get.put(BrandListController());
  }
}