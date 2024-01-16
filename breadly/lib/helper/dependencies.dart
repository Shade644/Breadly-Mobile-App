import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/controllers/user_controller.dart';
import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/data/repository/auth_repo.dart';
import 'package:breadly/data/repository/cart_repo.dart';
import 'package:breadly/data/repository/popular_product_repo.dart';
import 'package:breadly/data/repository/recommended_product_repo.dart';
import 'package:breadly/data/repository/user_repo.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL_LOCAL));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));

   Get.lazyPut(() => UserRepo(apiClient: Get.find(),));
   Get.lazyPut(() => UserController(userRepo: Get.find(),));
 
}