import 'package:breadly/data/API/api_client_mvs.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClientMvs apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}