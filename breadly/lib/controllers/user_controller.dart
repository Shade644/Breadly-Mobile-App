import 'package:breadly/data/repository/user_repo.dart';
import 'package:breadly/models/response_model.dart';
import 'package:breadly/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;

  UserController({
    required this.userRepo
  });

  bool _isLoading = false;
  late UserModel _userModel;
  UserModel get userModel => _userModel;
  bool get isLoading => _isLoading;  

  Future<ResponseModel> getUserInfo() async{
   Response response = await userRepo.getUserInfo();
   late ResponseModel responseModel;
   print("Response body: ${response.body}");
   if(response.statusCode == 200){
    _userModel = UserModel.fromJson(response.body);
    _isLoading = true;
    responseModel = ResponseModel(true, "sukcess");
   }
   else{
    responseModel = ResponseModel(false, response.statusText!);
   }
   update();
   return responseModel;
  }
}
