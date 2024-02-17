import 'dart:convert';
import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/models/signin_model.dart';
import 'package:breadly/models/signup_model.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBody signUpBody) async{
    return await apiClient.postData(AppConstants.REGISTRATION_URL_LOCAL, signUpBody.toJson());
  }

  Future<String> getUserToken() async{
    return sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  Future<Response> login(SignInBody signInBody) async{
    return await apiClient.postDataLogin(AppConstants.LOGIN_URL, signInBody);
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

 Future<bool> saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeaderReg(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberandPassword(String number, String password) async{
    try{
     await sharedPreferences.setString(AppConstants.PHONE, number);
     await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      rethrow;
    }
  }

Map<String, dynamic> decodeToken(String token) {
  List<String> parts = token.split('.');
  String normalized = base64Url.normalize(parts[1]);
  int paddingLength = (normalized.length % 4 == 0) ? 0 : (4 - normalized.length % 4);
  String padding = '=' * paddingLength;
  String decodedData = utf8.decode(base64Url.decode(normalized + padding));
  return json.decode(decodedData);
}


  
  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    sharedPreferences.remove(AppConstants.USER_ID);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }


}