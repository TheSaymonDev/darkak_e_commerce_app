import 'package:darkak_e_commerce_app/services/api_service.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/model/final_category.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool isLoading = false;
  List<Category> categories = [];
  // Future<void> getCategoryList() async{
  //   isLoading = true;
  //   update();
  //   try{
  //     List<dynamic> responseData = await ApiService().getApi(AppUrls.getAllCategoryUrl);
  //     if(responseData.isNotEmpty){
  //       categories = responseData.map((item) => Category.fromJson(item)).toList();
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

  Future<void> getCategoryList() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.getAllCategoryUrl);
      if (response.success) {
        List<dynamic> data = response.data;
        categories = data.map((item) => Category.fromJson(item)).toList();
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