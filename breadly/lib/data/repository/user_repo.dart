import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.USER_URL);

  }
 
  
}
