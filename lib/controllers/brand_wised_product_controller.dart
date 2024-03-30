import 'package:darkak_e_commerce_app/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:get/get.dart';

class BrandWisedProductListController extends GetxController{
  List<Product> productList = [];
  void getFilterProductByBrand(String brandId){
    productList = Get.find<ProductListController>().productList.where((product) => product.brand!.id== brandId).toList();
    update();
  }
}