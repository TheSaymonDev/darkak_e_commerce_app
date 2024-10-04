import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:get/get.dart';

class WishlistBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(WishListItemController());
   Get.lazyPut(() => AddToWishlistController());
  }
}