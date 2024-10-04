import 'package:darkak_e_commerce_app/screens/explore_screen/model/brand_model.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:get/get.dart';


class BrandWisedProductListController extends GetxController{

  late List<BrandModel> brandListData;
  List<ProductModel> productListData = [];
  void getFilterProductByBrand(String brandId){
    productListData = Get.find<ProductListController>().productsData.where((product) => product.brand!.id== brandId).toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    brandListData = Get.arguments['brandListData'] as List<BrandModel>;
    getFilterProductByBrand(brandListData[0].id!);
  }

}