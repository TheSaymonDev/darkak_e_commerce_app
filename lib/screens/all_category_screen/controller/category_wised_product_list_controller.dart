import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/final_product.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/products.dart';
import 'package:get/get.dart';

class CategoryWisedProductListController extends GetxController{
  List<Products> productList = [];
  void getFilterProductByCategory(String categoryId){
    productList = Get.find<ProductListController>().products.where((product) => product.category!.id== categoryId).toList();
    update();
  }
}