import 'package:darkak_e_commerce_app/screens/cart_screen/controller/add_to_cart_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/order_package_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/step_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/step_delivery_type_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controller/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_management_screen/controller/address_update_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/controller/address_view_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/forget_otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/controller/identity_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/controller/set_password_controller.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/controller/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controller/brand_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/all_brand_screen/controller/brand_wised_product_controller.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/controller/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controller/category_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/all_category_screen/controller/category_wised_product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_management_screen/controller/create_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/controller/home_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/controller/my_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/onboarding_screen/controller/onboarding_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/order_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/controller/product_details_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/controller/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controller/wishlist_item_controller.dart';
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
    Get.put(TimerController());
    Get.put(ResendOTPController());
    Get.put(HomeScreenController());
    Get.put(ProductListController());
    Get.put(ProfileController());
    Get.put(AddToCartController());
    Get.put(CartItemController());
    Get.put(AddToWishListController());
    Get.put(WishListItemController());
    Get.put(ProductDetailsScreenController());
    Get.put(OrderController());
    Get.put(CategoryListController());
    Get.put(BrandListController());
    Get.put(BrandWisedProductListController());
    Get.put(CategoryWisedProductListController());
    Get.put(MyOrderController());
    Get.put(CreateAddressController());
    Get.put(AddressViewController());
    Get.put(AddressUpdateController());
    Get.put(StepDeliveryTypeController());
    Get.put(StepAddressController());
    Get.put(OrderPackageController());
  }
}