import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_category.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool isLoading = false;
  List<Category> categoryList = [];
  Future<void> getCategoryList() async{
    isLoading = true;
    update();
    try{
      List<dynamic> responseData = await ApiService().getApi(Urls.getAllCategoryUrl);
      if(responseData.isNotEmpty){
        categoryList = responseData.map((item) => Category.fromJson(item)).toList();
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