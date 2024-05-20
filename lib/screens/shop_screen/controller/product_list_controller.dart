
import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ProductListController extends GetxController {
  bool isLoading = true;
  List<Product> products = [];
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
        products = data.map((item) => Product.fromJson(item)).toList();
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Something went wrong';
        print('try=================$errorMessage');
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      print('try=================$error');
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  List<Product> filterProductsByBrand(String brandId) {
    products =
        products.where((product) => product.brand!.id == brandId).toList();
    update();
    return products;
  }
}
