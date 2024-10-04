import 'package:darkak_e_commerce_app/screens/explore_screen/model/category_model.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:get/get.dart';


class CategoryWisedProductListController extends GetxController{
  late List<CategoryModel> categoryData;
  List<ProductModel> productList = [];
  void getFilterProductByCategory(String categoryId){
    productList = Get.find<ProductListController>().productsData.where((product) => product.category!.id== categoryId).toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    categoryData = Get.arguments['categoryData'] as List<CategoryModel>;
    getFilterProductByCategory(categoryData[0].id!);
  }

}