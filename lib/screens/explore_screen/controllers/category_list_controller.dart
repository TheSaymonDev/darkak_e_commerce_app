import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/services/connectivity_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/model/category_model.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool isLoading = false;
  List<CategoryModel> categories = [];

  Future<void> getCategoryList() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
  _setLoading(true);
    try {
      final response = await ApiService().get(url: AppUrls.getAllCategoryUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        categories = data.map((item) => CategoryModel.fromJson(item)).toList();
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
  void getFilterProductByCategory(String categoryId){
    productListData = Get.find<ProductListController>().productsData.where((product) => product.category!.id== categoryId).toList();
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

}