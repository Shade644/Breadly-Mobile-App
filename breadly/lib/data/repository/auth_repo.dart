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
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  Future<Response> login(SignInBody signInBody) async{
    return await apiClient.postDataLogin(AppConstants.LOGIN_URL, signInBody);
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

//  Future<bool> saveUserToken(String acces_token) async{
//     apiClient.token = acces_token;
//     apiClient.updateHeader(acces_token);
//     return await sharedPreferences.setString(AppConstants.TOKEN, acces_token);
//   }

Future<bool> saveUserToken(Map<String, dynamic> tokenResponse) async {
  // Odczytaj wartość pola "acces_token" z odpowiedzi
  String accessToken = tokenResponse["acces_token"];

  // Ustaw token w apiClient i zaktualizuj nagłówek
  apiClient.token = accessToken;
  apiClient.updateHeader(accessToken);

  // Zapisz token w sharedPreferences
  return await sharedPreferences.setString(AppConstants.TOKEN, accessToken);
}


  Future<void> saveUserNumberandPassword(String number, String password) async{
    try{
     await sharedPreferences.setString(AppConstants.PHONE, number);
     await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }

}