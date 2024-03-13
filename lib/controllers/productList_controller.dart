import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{
  bool isLoading = true;
  List<Product> products = [];
  void fetchProducts() async{
    isLoading = true;
    update();
    List<dynamic> responseData = await ApiService().getApi('$baseUrl/products');
    if(responseData.isNotEmpty){
      products = responseData.map((item) => Product.fromJson(item)).toList();
      isLoading=false;
      update();
    }else{
      customErrorMessage(message: 'Something Went Wrong');
      isLoading=false;
      update();
    }
  }
}