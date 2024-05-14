import 'package:darkak_e_commerce_app/screens/shop_screen/model/final_product.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/products.dart';
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool isLoading = true;
  List<Products> products = [];
  // Future<void> getProductList() async{
  //   isLoading = true;
  //   update();
  //   try{
  //     List<dynamic> responseData = await ApiService().getApi(AppUrls.getAllProductsUrl);
  //     if(responseData.isNotEmpty){
  //       products = responseData.map((item) => Product.fromJson(item)).toList();
  //       isLoading=false;
  //       update();
  //     }else{
  //       customErrorMessage(message: 'Something Went Wrong');
  //       isLoading=false;
  //       update();
  //     }
  //   }catch (error) {
  //     customErrorMessage(message: error.toString());
  //     isLoading = false;
  //     update();
  //   }
  // }

  Future<void> getProductList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getAllProductsUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        products = data.map((item) => Products.fromJson(item)).toList();
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  List<Products> filterProductsByBrand(String brandId) {
    products =
        products.where((product) => product.brand!.id == brandId).toList();
    update();
    return products;
  }
}
