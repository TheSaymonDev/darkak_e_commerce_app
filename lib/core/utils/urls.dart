import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';

class Urls{
  static const String watchImage = 'assets/images/watch.jpg';
  static const String sareeImage = 'assets/images/product-img.png';
  static const String takaSign = '৳';
  static const String myBankCard = 'assets/images/card.png';
  static const String _lottiePath = 'assets/lotties';

  static String emptyCartLottie = '$_lottiePath/empty_cart.json';
  static String emptyWishListLottie = '$_lottiePath/empty_wishlist.json';

  static const String appLogoSvg = 'assets/images/app-logo.svg';

  static const String imgUrl = 'https://api.darkak.com.bd/';
  static const String _baseUrl = "https://api.darkak.com.bd/api/v1";
  static const Map<String, String> requestHeader = {"Content-Type": "application/json"};
  static Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "Authorization":"Bearer ${SharedPreferencesService().getToken()}"};

  static String signInUrl = '$_baseUrl/users/login';
  static String signUpUrl = '$_baseUrl/users';
  static String identityUrl = '$_baseUrl/users/forget-password';
  static String otpVerificationUrl = '$_baseUrl/users/otp-verify';
  static String forgetOtpVerificationUrl = '$_baseUrl/users/forget-password/otp-verify';
  static String setPasswordUrl = '$_baseUrl/users/reset-password';
  static String getAllProductsUrl = '$_baseUrl/products';
  static String getCurrentUserUrl = '$_baseUrl/users/current';
  static String profileUpdateUrl = '$_baseUrl/users';
  static String addToCartUrl = '$_baseUrl/carts';
  static String getCartItemUrl = '$_baseUrl/carts';
  static String removeCartItemUrl = '$_baseUrl/carts';
  static String addToWishListUrl = '$_baseUrl/wishlist';
  static String getWishListProductUrl = '$_baseUrl/wishlist';
  static String removeWishListItemUrl = '$_baseUrl/wishlist';
}
