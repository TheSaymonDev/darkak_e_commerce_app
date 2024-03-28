import 'package:darkak_e_commerce_app/core/services/api_service.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_my_order.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController{
  bool isLoading = false;
  List<MyOrder> myOrderList = [];
  Future<void> getMyOrderList() async{
    isLoading = true;
    update();
    try{
      List<dynamic> responseData = await ApiService().getApi(Urls.getMyOrderUrl, header: Urls.requestHeaderWithToken);
      if(responseData.isNotEmpty){
        myOrderList = responseData.map((item) => MyOrder.fromJson(item)).toList();
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