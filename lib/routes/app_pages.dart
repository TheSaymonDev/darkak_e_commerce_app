import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/about_screen/about_screen.dart';
import 'package:darkak_e_commerce_app/screens/address_create_screen/address_create_screen.dart';
import 'package:darkak_e_commerce_app/screens/address_create_screen/bindings/address_create_binding.dart';
import 'package:darkak_e_commerce_app/screens/address_update_screen/address_update_screen.dart';
import 'package:darkak_e_commerce_app/screens/address_update_screen/bindings/address_update_binding.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/address_view_screen.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/bindings/address_view_binding.dart';
import 'package:darkak_e_commerce_app/screens/all_brand_screen/all_brand_screen.dart';
import 'package:darkak_e_commerce_app/screens/all_brand_screen/bindings/all_brand_binding.dart';
import 'package:darkak_e_commerce_app/screens/all_category_screen/all_category_screen.dart';
import 'package:darkak_e_commerce_app/screens/all_category_screen/bindings/all_category_binding.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/bindings/cart_binding.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/bindings/checkout_binding.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/checkout_screen.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/bindings/explore_binding.dart';
import 'package:darkak_e_commerce_app/screens/help_and_support_screen/bindings/help_and_support_binding.dart';
import 'package:darkak_e_commerce_app/screens/help_and_support_screen/help_and_support_screen.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/bindings/home_binding.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/home_screen.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/bindings/identity_verification_binding.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/identity_verification_screen.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/bindings/my_order_binding.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/my_order_screen.dart';
import 'package:darkak_e_commerce_app/screens/onboarding_screen/bindings/onboarding_binding.dart';
import 'package:darkak_e_commerce_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/bindings/otp_verification_binding.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/screens/payment_success_screen/payment_success_screen.dart';
import 'package:darkak_e_commerce_app/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/bindings/product_details_binding.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:darkak_e_commerce_app/screens/product_listing_screen/bindings/product_listing_binding.dart';
import 'package:darkak_e_commerce_app/screens/product_listing_screen/product_listing_screen.dart';
import 'package:darkak_e_commerce_app/screens/product_view_screen/bindings/product_view_binding.dart';
import 'package:darkak_e_commerce_app/screens/product_view_screen/product_view_screen.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/bindings/profile_binding.dart';
import 'package:darkak_e_commerce_app/screens/profile_update_screen/bindings/profile_update_binding.dart';
import 'package:darkak_e_commerce_app/screens/profile_update_screen/profile_update_screen.dart';
import 'package:darkak_e_commerce_app/screens/review_screen/review_screen.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/bindings/set_password_bindings.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/set_password_screen.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/bindings/shop_binding.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/bindings/sign_in_binding.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/bindings/sign_up_binding.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/bindings/wishlist_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => const OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
        name: AppRoutes.signInScreen,
        page: () => SignInScreen(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.signUpScreen,
        page: () => SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.identityVerificationScreen,
        page: () => IdentityVerificationScreen(),
        binding: IdentityVerificationBinding()),
    GetPage(
        name: AppRoutes.otpVerificationScreen,
        page: () => OtpVerificationScreen(),
        binding: OtpVerificationBinding()),
    GetPage(
        name: AppRoutes.setPasswordScreen,
        page: () => SetPasswordScreen(),
        binding: SetPasswordBinding()),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
        ExploreBinding(),
        ShopBinding(),
        CartBinding(),
        WishlistBinding(),
        ProfileBinding(),
        AddressViewBinding(),
      ],
    ),
    GetPage(
        name: AppRoutes.allCategoryScreen,
        page: () => const AllCategoryScreen(),
        binding: AllCategoryBinding()),
    GetPage(
        name: AppRoutes.allBrandScreen,
        page: () => const AllBrandScreen(),
        binding: AllBrandBinding()),
    GetPage(
        name: AppRoutes.productListingScreen,
        page: () => ProductListingScreen(),
        binding: ProductListingBinding()),
    GetPage(
        name: AppRoutes.productDetailsScreen,
        page: () => ProductDetailsScreen(),
        binding: ProductDetailsBinding()),
    GetPage(name: AppRoutes.reviewScreen, page: () => const ReviewScreen()),
    GetPage(
        name: AppRoutes.productViewScreen,
        page: () => ProductViewScreen(),
        binding: ProductViewBinding()),
    GetPage(
        name: AppRoutes.profileUpdateScreen,
        page: () => const ProfileUpdateScreen(),
        binding: ProfileUpdateBinding()),
    GetPage(
        name: AppRoutes.addressViewScreen,
        page: () => const AddressViewScreen(),
        binding: AddressViewBinding()),
    GetPage(
        name: AppRoutes.addressCreateScreen,
        page: () => AddressCreateScreen(),
        binding: AddressCreateBinding()),
    GetPage(
        name: AppRoutes.addressUpdateScreen,
        page: () => AddressUpdateScreen(),
        binding: AddressUpdateBinding()),
    GetPage(
        name: AppRoutes.privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(
        name: AppRoutes.helpAndSupportScreen,
        page: () => const HelpAndSupportScreen(),
        binding: HelpAndSupportBinding()),
    GetPage(name: AppRoutes.aboutScreen, page: () => const AboutScreen()),
    GetPage(
        name: AppRoutes.checkoutScreen,
        page: () => const CheckoutScreen(),
        binding: CheckoutBinding()),
    GetPage(
        name: AppRoutes.paymentSuccessScreen,
        page: () => const PaymentSuccessScreen()),
    GetPage(
        name: AppRoutes.myOrderScreen,
        page: () => const MyOrderScreen(),
        binding: MyOrderBinding()),
  ];
}
