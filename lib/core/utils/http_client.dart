import 'dart:convert';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/identity_verification.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/otp_verification.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/set_password.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_in.dart';
import 'package:darkak_e_commerce_app/models/authentication_models/sign_up.dart';
import 'package:darkak_e_commerce_app/models/product.dart';
import 'package:darkak_e_commerce_app/models/user.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:http/http.dart' as http;

Future<bool> logInRequest(SignIn signIn) async {
  try{
    var url = Uri.parse("$baseUrl/users/login");
    var postBody = json.encode(signIn);
    var response = await http.post(url, headers: requestHeader, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200) {
      SharedPreferencesService().saveToken(resultBody['accessToken']);
      SharedPreferencesService().saveUserData(resultBody);
      return true;
    } else {
      return false;
    }
  }catch(error){
    throw Exception('Login failed: $error');
  }
}

Future<String?> registrationRequest(SignUp signUp) async {
  try{
    var url = Uri.parse("$baseUrl/users");
    var postBody = json.encode(signUp);
    var response = await http.post(url, headers: requestHeader, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 201) {
      return resultBody["user"]["id"];
    } else {
      return null;
    }
  }catch(error){
    throw Exception('Login failed: $error');
  }
}

Future<String?> verifyIdentifierRequest(IdentityVerification identityVerification) async {
  try{
    var url = Uri.parse("$baseUrl/users/forget-password");
    var postBody = json.encode(identityVerification);
    var response = await http.post(url, headers: requestHeader, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200) {
      return resultBody['userId'];
    } else {
      return null;
    }
  }catch(error){
    throw Exception('Login failed: $error');
  }
}

Future<bool> verifyOtpRequest(OtpVerification otpVerification) async {
  try{
    var url = Uri.parse("$baseUrl/users/otp-verify");
    var postBody = json.encode(otpVerification);
    var response = await http.post(url, headers: requestHeader, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if(resultCode == 200){
      SharedPreferencesService().saveToken(resultBody['accessToken']);
      SharedPreferencesService().saveUserData(resultBody);
      return true;
    }else{
      return false;
    }
  }catch(error){
    throw Exception('Login failed: $error');
  }
}

Future<bool> forgetVerifyOtpRequest(OtpVerification otpVerification) async {
 try{
   var url = Uri.parse("$baseUrl/users/forget-password/otp-verify");
   var postBody = json.encode(otpVerification);
   var response = await http.post(url, headers: requestHeader, body: postBody);
   var resultCode = response.statusCode;
   if(resultCode == 200){
     return true;
   }else{
     return false;
   }
 }catch(error){
   throw Exception('Login failed: $error');
 }
}

Future<bool> setPasswordRequest(SetPassword setPassword) async {
 try{
   var url = Uri.parse("$baseUrl/users/reset-password");
   var postBody = json.encode(setPassword);
   var response = await http.post(url, headers: requestHeader, body: postBody);
   var resultCode = response.statusCode;
   if(resultCode == 200){
     return true;
   }else{
     return false;
   }
 }catch(error){
   throw Exception('Login failed: $error');
 }
}

// Future<Profile> fetchProfile() async{
//   var url = Uri.parse("$baseUrl/users/current");
//   var response = await http.get(url);
//   var resultCode = response.statusCode;
//   if(resultCode == 200){
//     final  data = json.decode(response.body);
//     return Profile.fromJson(data);
//   }else{
//     throw Exception('Failed to fetch products: ${response.statusCode}');
//   }
// }
//
// Future<bool> profileUpdateRequest(String id, Profile user) async{
//   try{
//     var url = Uri.parse("$baseUrl/users/$id");
//     var postBody = jsonEncode(user);
//     print(postBody);
//     var response = await http.patch(url, headers: requestHeaderWithToken, body: postBody);
//     var resultCode = response.statusCode;
//     print(resultCode);
//     print(response.body);
//     if(resultCode == 200){
//       return true;
//     }else{
//       return false;
//     }
//   }catch(error){
//     customErrorMessage(message: error.toString());
//     throw Exception('Login failed: $error');
//   }
// }

Future<List<Product>> fetchProductRequest() async{
  var url = Uri.parse("$baseUrl/products");
  var response = await http.get(url);
  var resultCode = response.statusCode;
  if(resultCode==200){
    final List<dynamic> data = json.decode(response.body);
    return data.map((item) => Product.fromJson(item)).toList();
  }else{
    throw Exception('Failed to fetch products: ${response.statusCode}');
  }
}
