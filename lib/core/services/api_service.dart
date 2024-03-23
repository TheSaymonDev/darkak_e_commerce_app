import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getApi(String url, {Map<String, String>? header}) async {
    log(url.toString());
    final response =
        await http.get(Uri.parse(url), headers: header ?? Urls.requestHeader);
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> postApi(String url, dynamic data, {Map<String, String>? header}) async {
    log(url.toString());
    log(data.toString());
    final response = await http.post(Uri.parse(url), headers: header ?? Urls.requestHeader, body: jsonEncode(data));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }else if(response.statusCode == 404){
      return 404;
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
      request.headers.addAll(Urls.requestHeaderWithToken);
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
      request.headers.addAll(Urls.requestHeaderWithToken);
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

  Future<dynamic> deleteApi(String url) async {
    log(url.toString());
    final response = await http.delete(Uri.parse(url), headers: Urls.requestHeaderWithToken);
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

}
