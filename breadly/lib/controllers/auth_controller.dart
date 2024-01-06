import 'dart:convert';
import 'package:breadly/data/repository/auth_repo.dart';
import 'package:breadly/models/response_model.dart';
import 'package:breadly/models/signin_model.dart';
import 'package:breadly/models/signup_model.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late String userId;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["acces_token"]);
      responseModel = ResponseModel(true, response.body["acces_token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInBody signInBody) async {
    print("Getting Token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("backend");
      authRepo.saveUserToken(response.body["acces_token"]);
      print(response.body["acces_token"].toString());
      final decodedToken = decodeToken(response.body["acces_token"]);
      userId = decodedToken["user_id"].toString();
      AppConstants.USER_ID = userId;
      print("Decoded Token: $userId");

      responseModel = ResponseModel(true, response.body["acces_token"]);
    } else {
      print("Błąd logowania. Kod błędu: ${response.statusCode}");
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Map<String, dynamic> decodeToken(String token) {
    List<String> parts = token.split('.');
    String decodedData = utf8.decode(base64Url.decode(parts[1]));
    return json.decode(decodedData);
  }

  void saveUserNumberandPassword(String number, String password) {
    authRepo.saveUserNumberandPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}


