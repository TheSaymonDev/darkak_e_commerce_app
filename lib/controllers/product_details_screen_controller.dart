import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {
  bool isExpanded = false;
  void toggleDes() {
    isExpanded = !isExpanded;
    update();
  }

  String? selectedSize;
  void productSizeChange(newValue) {
    selectedSize = newValue;
    update();
  }

  String? selectedColor;
  void productColorChange(newValue) {
    selectedColor = newValue;
    update();
  }

  int quantity = 1;
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    update();
  }

  void incrementQuantity(int alertQuantity) {
    if (alertQuantity != quantity) {
      quantity++;
    }else{
      customErrorMessage(message: 'Out of Stock This Product');
    }
    update();
  }

  int calculateTotal(int productOfferPrice) {
    int total = 0;
    total += productOfferPrice * quantity;
    return total;
  }

  int selectedImg = 0;
  void imageSelection(int index){
    selectedImg = index;
    update();
  }
}
