import 'package:darkak_e_commerce_app/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:get/get.dart';

class CategoryWisedProductListController extends GetxController{
  List<Product> productList = [];
  void getFilterProductByCategory(String categoryId){
    productList = Get.find<ProductListController>().productList.where((product) => product.category!.id== categoryId).toList();
    update();
  }
}