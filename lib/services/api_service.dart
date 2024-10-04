import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/api_response.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ApiService {

  Future<ApiResponse<dynamic>> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');

    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> post({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<dynamic> getApi(String url, {Map<String, String>? header}) async {
    log(url.toString());
    log('token is =${header.toString()}');
    final response = await http.get(Uri.parse(url),
        headers: header ?? AppUrls.requestHeader);
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  // Future<dynamic> postApi(String url, dynamic data,
  //     {Map<String, String>? header}) async {
  //   log(url.toString());
  //   log(data.toString());
  //   final response = await http.post(Uri.parse(url),
  //       headers: header ?? AppUrls.requestHeader, body: jsonEncode(data));
  //   log(response.statusCode.toString());
  //   log(response.body.toString());
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return jsonDecode(response.body);
  //   } else if (response.statusCode == 404) {
  //     return 404;
  //   } else {
  //     return null;
  //   }
  // }

  Future<dynamic> patchApi(String url, dynamic data,
      {Map<String, String>? header}) async {
    log(url.toString());
    log(data.toString());
    final response = await http.patch(Uri.parse(url),
        headers: header ?? AppUrls.requestHeader, body: jsonEncode(data));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      return 404;
    } else {
      return null;
    }
  }

  Future<ApiResponse<dynamic>> patch({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.patch(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  // Future<bool> patchMultiPartApi(
  //   String url,
  //   Map<String, dynamic>? data, {
  //   File? file,
  // }) async {
  //   log(url.toString());
  //   log(file.toString());
  //   log(data.toString());
  //   String token = SharedPreferencesService().getToken();
  //   Map<String, String> headerWithToken = {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token"
  //   };
  //   if (file == null) {
  //     var request = http.MultipartRequest('PATCH', Uri.parse(url));
  //     request.headers.addAll(headerWithToken);
  //     data!.forEach((key, value) => request.fields[key] = value.toString());
  //     var response = await request.send();
  //     log(response.statusCode.toString());
  //     log(response.stream.bytesToString().toString());
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     var request = http.MultipartRequest('PATCH', Uri.parse(url));
  //     request.headers.addAll(headerWithToken);
  //     data!.forEach((key, value) => request.fields[key] = value.toString());
  //     String fieldName = 'image';
  //     request.files
  //         .add(await http.MultipartFile.fromPath(fieldName, file.path));
  //     var response = await request.send();
  //     log(response.statusCode.toString());
  //     log(response.stream.bytesToString().toString());
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  // }

  Future<ApiResponse<dynamic>> patchMultipart({
    required String url,
    required dynamic data,
    File? file, // Make file argument optional
    required Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('File: $file');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final multipartRequest = http.MultipartRequest('PATCH', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);
    data.forEach((key, value) => multipartRequest.fields[key] = value.toString());

    if (file != null) { // Check if file is provided before adding it
      String fileField = 'image';
      multipartRequest.files.add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    developer.log('Status Code: ${streamResponse.statusCode}');
    developer.log('Body: ${streamResponse.body}');
    return _handleApiResponse(streamResponse);
  }





  // Future<dynamic> deleteApi(String url) async {
  //   log(url.toString());
  //   String token = SharedPreferencesService().getToken();
  //   Map<String, String> headerWithToken = {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token"
  //   };
  //   final response =
  //       await http.delete(Uri.parse(url), headers: headerWithToken);
  //   log(response.statusCode.toString());
  //   log(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else if (response.statusCode == 500) {
  //     return 500;
  //   } else {
  //     return null;
  //   }
  // }

  Future<ApiResponse<dynamic>> delete(
      {required String url, required Map<String, String>? headers}) async {
    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');
    final response =
        await http.delete(Uri.parse(url), headers: headers);
    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }


  ApiResponse<dynamic> _handleApiResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.success(data: jsonDecode(response.body));
    } else {
      return ApiResponse.error(
          status: response.statusCode, message: jsonDecode(response.body));
    }
  }
}
