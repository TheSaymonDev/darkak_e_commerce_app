import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool isLoading = true;
  List<ProductModel> productsData = [];

  Future<void> getProductList() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
   _setLoading(true);
    try {
      final response = await ApiService().get(url: AppUrls.getAllProductsUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        productsData = data.map((item) => ProductModel.fromJson(item)).toList();
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

  List<ProductModel> filterProductsByBrand(String brandId) {
    productsData = productsData.where((product) => product.brand!.id == brandId).toList();
    update();
    return productsData;
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

}
