import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getApi(String url, [Map<String, String>? header]) async {
    log(url.toString());
    final response =
        await http.get(Uri.parse(url), headers: header ?? requestHeader);
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> postApi(String url, dynamic data) async {
    log(url.toString());
    log(data.toString());
    final response = await http.post(Uri.parse(url),
        headers: requestHeader, body: jsonEncode(data));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<bool> patchMultiPartApi(
    String url,
    Map<String, dynamic>? data, {
    File? file,
  }) async {
    log(url.toString());
    log(file.toString());
    log(data.toString());
    if (file == null) {
      var request = http.MultipartRequest('PATCH', Uri.parse(url));
      request.headers.addAll(requestHeaderWithToken);
      data!.forEach((key, value) => request.fields[key] = value.toString());
      var response = await request.send();
      log(response.statusCode.toString());
      log(response.stream.bytesToString().toString());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      var request = http.MultipartRequest('PATCH', Uri.parse(url));
      request.headers.addAll(requestHeaderWithToken);
      data!.forEach((key, value) => request.fields[key] = value.toString());
      String fieldName = 'image';
      request.files
          .add(await http.MultipartFile.fromPath(fieldName, file.path));
      var response = await request.send();
      log(response.statusCode.toString());
      log(response.stream.bytesToString().toString());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }
}
