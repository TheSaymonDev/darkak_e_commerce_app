import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';

class Urls{
  static const String watchImage = 'assets/images/watch.jpg';
  static const String sareeImage = 'assets/images/product-img.png';
  static const String takaSign = '৳';
  static const String myBankCard = 'assets/images/card.png';

  static const String appLogoSvg = 'assets/images/app-logo.svg';

  static const String imgUrl = 'https://api.darkak.com.bd/';
  static const String baseUrl = "https://api.darkak.com.bd/api/v1";
  static const Map<String, String> requestHeader = {"Content-Type": "application/json"};
  static Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "Authorization":"Bearer ${SharedPreferencesService().getToken()}"};

  static const String signInUrl = '$baseUrl/users/login';
  static const String signUpUrl = '$baseUrl/users';
  static const String identityUrl = '$baseUrl/users/forget-password';
  static const String otpVerificationUrl = '$baseUrl/users/otp-verify';
  static const String forgetOtpVerificationUrl = '$baseUrl/users/forget-password/otp-verify';
  static const String setPasswordUrl = '$baseUrl/users/reset-password';
  static const String getAllProductsUrl = '$baseUrl/products';
  static const String getCurrentUserUrl = '$baseUrl/users/current';
  static const String profileUpdateUrl = '$baseUrl/users';
}
