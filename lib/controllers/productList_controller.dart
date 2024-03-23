import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{
  bool isLoading = true;
  List<Product> productList = [];
  void getProductList() async{
    isLoading = true;
    update();
    try{
      List<dynamic> responseData = await ApiService().getApi(Urls.getAllProductsUrl);
      if(responseData.isNotEmpty){
        productList = responseData.map((item) => Product.fromJson(item)).toList();
        isLoading=false;
        update();
      }else{
        customErrorMessage(message: 'Something Went Wrong');
        isLoading=false;
        update();
      }
    }catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }
}