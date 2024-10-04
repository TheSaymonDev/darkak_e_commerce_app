import 'package:darkak_e_commerce_app/screens/shop_screen/models/colors.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/sizes.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
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

  late ProductModel product;
  List<String> productSizes = [];
  List<String> productColors = [];
  getSizes() {
    for (int i = 0; i < product.sizes!.length; i++) {
      // Access the size object at the current index
      Sizes productSize = product.sizes![i];
      // Add the size name to the sizes list
      productSizes.add(productSize.name!); // Assuming name is non-null
    }
  }

  getColors() {
    for (int i = 0; i < product.colors!.length; i++) {
      ColorsP productColor = product.colors![i];
      productColors.add(productColor.name!);
    }
  }
  @override
  void onInit() {
    super.onInit();
    product = Get.arguments['product'] as ProductModel;
    getSizes();
    getColors();
    selectedSize = productSizes[0];
    selectedColor = productColors[0];
  }
}
