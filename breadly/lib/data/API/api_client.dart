import 'dart:convert';
import 'package:breadly/models/signin_model.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late Map<String, String> _mainHeadersReg;  
  


  ApiClient({required this.appBaseUrl,}){
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = Duration(seconds: 30);

    
    _mainHeaders ={
      'Content-type':'application/x-www-form-urlencoded; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
     _mainHeadersReg ={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  void updateHeader(String token){
    _mainHeaders ={
      'Content-type':'application/x-www-form-urlencoded; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };    
  }
  void updateHeaderReg(String token){
    _mainHeadersReg ={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };    
  }
  Future<Response> getData(String uri,{Map<String, String>? headers}) async {
    try {
      Response response = await get(
        uri, 
        headers: headers??_mainHeadersReg
        );
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try{
     Response response = await post(uri, body, headers: _mainHeadersReg);
     print(response.toString());
     return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }


Future<Response> postDataLogin(String uri, SignInBody body) async {
  try {
    var encodedBody = {
      'username': body.username,
      'password': body.password,
    };

    Response response = await post(
      uri,
      FormData(encodedBody),
      headers: _mainHeaders,
    );

    print("Dane 2 ${response.toString()}");
    print("Pełne żądanie: $uri - ${jsonEncode(encodedBody)} - $_mainHeaders");
    return response;
  } catch (e) {
    print(e.toString());
    return Response(statusCode: 1, statusText: e.toString());
  }
}



}