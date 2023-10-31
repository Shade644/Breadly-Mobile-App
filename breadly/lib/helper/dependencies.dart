import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(()=>ApiClient(appBaseUrl: "url"));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}