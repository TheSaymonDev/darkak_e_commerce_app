import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/model/brand_model.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController{
  bool isLoading = false;
  List<BrandModel> brandsData = [];

  Future<void> getBrandList() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
   _setLoading(true);
    try {
      final response = await ApiService().get(url: AppUrls.getAllBrandUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        brandsData = data.map((item) => BrandModel.fromJson(item)).toList();
       _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
     _setLoading(false);
    }
  }

  List<ProductModel> productListData = [];
  void getFilterProductByBrand(String brandId){
    productListData = Get.find<ProductListController>().productsData.where((product) => product.brand!.id== brandId).toList();
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getBrandList();
  }

}