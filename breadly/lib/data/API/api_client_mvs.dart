import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClientMvs extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrlmvs;
  late Map<String, String> _mainHeaders;

  ApiClientMvs({required this.appBaseUrlmvs}){
    baseUrl = appBaseUrlmvs;
    token = AppConstants.TOKEN;
    timeout = const Duration(seconds: 30);
    _mainHeaders ={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  void updateHeader(String token){
    _mainHeaders ={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };    
  }
  Future<Response> getData(String uri,) async {
    try {
      Response response = await get(uri);
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  }
