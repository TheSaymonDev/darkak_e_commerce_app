import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/final_product.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/products.dart';
import 'package:get/get.dart';

class BrandWisedProductListController extends GetxController{
  List<Products> productList = [];
  void getFilterProductByBrand(String brandId){
    productList = Get.find<ProductListController>().products.where((product) => product.brand!.id== brandId).toList();
    update();
  }
}