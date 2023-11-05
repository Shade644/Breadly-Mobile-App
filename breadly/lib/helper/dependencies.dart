import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/data/repository/popular_product_repo.dart';
import 'package:breadly/data/repository/recommended_product_repo.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}