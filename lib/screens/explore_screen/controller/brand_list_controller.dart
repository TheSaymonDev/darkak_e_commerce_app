import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/model/final_brand.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController{
  bool isLoading = false;
  List<Brand> brands = [];

  // Future<void> getBrandList() async{
  //   isLoading = true;
  //   update();
  //   try{
  //     List<dynamic> responseData = await ApiService().getApi(AppUrls.getAllBrandUrl);
  //     if(responseData.isNotEmpty){
  //       brands = responseData.map((item) => Brand.fromJson(item)).toList();
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

  Future<void> getBrandList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getAllBrandUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        brands = data.map((item) => Brand.fromJson(item)).toList();
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
}