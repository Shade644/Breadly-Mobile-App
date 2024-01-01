import 'package:breadly/data/repository/auth_repo.dart';
import 'package:breadly/models/response_model.dart';
import 'package:breadly/models/signin_model.dart';
import 'package:breadly/models/signup_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async{
    _isLoading = true;
    update();
   Response response = await authRepo.registration(signUpBody);
   late ResponseModel responseModel;
   if(response.statusCode == 200){
    print("Rejestracja : ${response.body}");
    authRepo.saveUserToken(response.body["acces_token"]);
    responseModel = ResponseModel(true, response.body["acces_token"]);
   }
   else{
    responseModel = ResponseModel(false, response.statusText!);
   }
   _isLoading = false;
   update();
   return responseModel;
  }


  Future<ResponseModel> login(SignInBody signInBody) async {
  _isLoading = true;
  update();
  
  try {
    Response response = await authRepo.login(signInBody);

    if (response.statusCode == 200) {
      String accessToken = response.body["acces_token"];
      print("Pomyślnie zalogowano. Token: $accessToken");
      _isLoading = false;
      update();
      return ResponseModel(true, accessToken);
    } else {
      print("Błąd logowania. Kod błędu: ${response.statusCode}");
      print("Treść błędu: ${response.body}");
      _isLoading = false;
      update();
      return ResponseModel(false, response.statusText!);
    }
  } catch (error) {
    print("Błąd logowania: $error");
    _isLoading = false;
    update();
    return ResponseModel(false, "Wystąpił błąd podczas logowania.");
  }
}


    void saveUserNumberandPassword(String number, String password) {
      authRepo.saveUserNumberandPassword(number, password);
    }

    bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }

}