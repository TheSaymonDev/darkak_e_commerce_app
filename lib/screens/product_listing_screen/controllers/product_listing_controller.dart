import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:get/get.dart';

class ProductListingController extends GetxController{
  late List<ProductModel> productListData;
  @override
  void onInit() {
    super.onInit();
    productListData = Get.arguments['productListData'] as List<ProductModel>;
  }
}