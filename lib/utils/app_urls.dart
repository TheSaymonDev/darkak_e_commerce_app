import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';

class AppUrls{
  static const String watchImage = 'assets/images/watch.jpg';
  static const String sareeImage = 'assets/images/product-img.png';
  static const String takaSign = '৳';
  static const String myBankCard = 'assets/images/card.png';
  static const String _lottiePath = 'assets/lotties';
  static const String _imagePath = 'assets/images';

  static String emptyCartLottie = '$_lottiePath/empty_cart.json';
  static String emptyWishListLottie = '$_lottiePath/empty_wishlist.json';
  static String cashOnDeliveryLottie = '$_lottiePath/cash_on_delivery.json';

  static const String appLogoSvg = 'assets/images/app_logo.svg';

  static String lockPng = '$_imagePath/lock.png';

  static const String addAddress = 'Add New Address';
  static const String updateAddress = 'Update Address';

  static const String imgUrl = 'https://api.darkak.com.bd/';
  static const String _baseUrl = "https://api.darkak.com.bd/api/v1";
  static const Map<String, String> requestHeader = {"Content-Type": "application/json"};

  static Map<String, String> get getHeaderWithToken{
    final token = SharedPreferencesService().getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static String signInUrl = '$_baseUrl/users/login';
  static String signUpUrl = '$_baseUrl/users';
  static String identityUrl = '$_baseUrl/users/forget-password';
  static String otpVerificationUrl = '$_baseUrl/users/otp-verify';
  static String forgetOtpVerificationUrl = '$_baseUrl/users/forget-password/otp-verify';
  static String setPasswordUrl = '$_baseUrl/users/reset-password';
  static String resendOTPUrl = '$_baseUrl/resend-otp';

  static String getAllProductsUrl = '$_baseUrl/products';
  static String getCurrentUserUrl = '$_baseUrl/users/current';
  static String profileUpdateUrl = '$_baseUrl/users';
  static String addToCartUrl = '$_baseUrl/carts';
  static String getCartItemUrl = '$_baseUrl/carts';
  static String removeCartItemUrl = '$_baseUrl/carts';
  static String addToWishListUrl = '$_baseUrl/wishlist';
  static String getWishListProductUrl = '$_baseUrl/wishlist';
  static String removeWishListItemUrl = '$_baseUrl/wishlist';
  static String createOrderUrl = '$_baseUrl/orders';
  static String getAllCategoryUrl = '$_baseUrl/categories';
  static String getAllBrandUrl = '$_baseUrl/brands';
  static String getMyOrderUrl = '$_baseUrl/orders';
  static String addressUrl = '$_baseUrl/address';
  static String orderPackageUrl = '$_baseUrl/packages';
}
