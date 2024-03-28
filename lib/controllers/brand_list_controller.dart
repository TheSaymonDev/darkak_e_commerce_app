import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_brand.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController{
  bool isLoading = false;
  List<Brand> brandList = [];
  Future<void> getBrandList() async{
    isLoading = true;
    update();
    try{
      List<dynamic> responseData = await ApiService().getApi(Urls.getAllBrandUrl);
      if(responseData.isNotEmpty){
        brandList = responseData.map((item) => Brand.fromJson(item)).toList();
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