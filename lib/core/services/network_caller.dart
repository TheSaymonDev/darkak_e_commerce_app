import 'dart:convert';
import 'dart:developer';

import 'package:darkak_e_commerce_app/models/response_data.dart';
import 'package:http/http.dart';

class NetworkCaller{
  Future<ResponseData> getRequest(String url) async{
    log(url.toString());
    final Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    log(response.body);
    if(response.statusCode == 200){
      final decodeResponse = jsonDecode(response.body);
      return ResponseData(isLoading: true, statusCode: response.statusCode, responseData: decodeResponse);
    }else{
      return ResponseData(isLoading: false, statusCode: response.statusCode, responseData: '');
    }
  }

  Future<ResponseData> postRequest(String url, {Map<String, dynamic>? data}) async{
    log(url.toString());
    log(data.toString());
    final Response response = await post(Uri.parse(url), body: data);
    log(response.statusCode.toString());
    log(response.body);
    if(response.statusCode == 200){
      final decodeResponse = jsonDecode(response.body);
      return ResponseData(isLoading: true, statusCode: response.statusCode, responseData: decodeResponse);
    }else{
      return ResponseData(isLoading: false, statusCode: response.statusCode, responseData: '');
    }
  }
}