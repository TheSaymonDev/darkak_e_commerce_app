import 'dart:convert';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/shared_preferences.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:http/http.dart' as http;

Future<bool> logInRequest(formValues) async {
  var url = Uri.parse("$baseUrl/users/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200) {
    customSuccessMessage(message: 'Successfully Login');
    await writeUserData(resultBody);
    return true;
  } else {
    customErrorMessage(message: 'Login Failed');
    return false;
  }
}

Future<String?> registrationRequest(formValues) async {
  var url = Uri.parse("$baseUrl/users");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 201) {
    customSuccessMessage(message: resultBody["message"]);
    return resultBody["user"]["id"];
  } else {
    customErrorMessage(message: resultBody["message"]);
    return null;
  }
}

Future<bool> verifyEmailRequest(email) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    customSuccessMessage(message: 'Sent OTP your email');
    return true;
  } else {
    customErrorMessage(message: 'Verification Failed');
    return false;
  }
}

Future<bool> verifyPinCodeRequest(formValues) async {
  var url = Uri.parse("$baseUrl/users/verify");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200){
    await writeUserData(resultBody);
    customSuccessMessage(message: 'OTP verified');
    return true;
  }else{
    customErrorMessage(message: 'OTP is not verified');
    return false;
  }
}

Future<bool> setPasswordRequest(formValues) async {
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Password Reset Successful');
    return true;
  }else{
    customErrorMessage(message: 'Password Reset Failed');
    return false;
  }
}
