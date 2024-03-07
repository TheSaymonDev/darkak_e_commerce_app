import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ShopController extends GetxController{
  bool isLoading = true;
  List? products;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchProducts();
  }

  void _fetchProducts() async{
     products = await fetchProductRequest();
     if(products!.isNotEmpty){
       isLoading=false;
       update();
     }else{
       customErrorMessage(message: 'Something went wrong');
       isLoading = false;
       update();
     }
  }
}