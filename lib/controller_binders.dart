import 'package:darkak_e_commerce_app/controllers/add_to_cart_controller.dart';
import 'package:darkak_e_commerce_app/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/forget_otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/identity_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/set_password_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_up_controller.dart';
import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/home_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/onboarding_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/order_controller.dart';
import 'package:darkak_e_commerce_app/controllers/productList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/product_details_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/wishlist_item_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(IdentityVerificationController());
    Get.put(ForgetOtpVerificationController());
    Get.put(SetPasswordController());
    Get.put(HomeScreenController());
    Get.put(ProductListController());
    Get.put(ProfileController());
    Get.put(AddToCartController());
    Get.put(CartItemController());
    Get.put(AddToWishListController());
    Get.put(WishListItemController());
    Get.put(ProductDetailsScreenController());
    Get.put(CheckOutScreenController());
    Get.put(OrderController());
  }
}