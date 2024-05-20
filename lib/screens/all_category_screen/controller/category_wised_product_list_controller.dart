import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:get/get.dart';

import '../../shop_screen/model/product.dart';

class CategoryWisedProductListController extends GetxController{
  List<Product> productList = [];
  void getFilterProductByCategory(String categoryId){
    productList = Get.find<ProductListController>().products.where((product) => product.category!.id== categoryId).toList();
    update();
  }
}