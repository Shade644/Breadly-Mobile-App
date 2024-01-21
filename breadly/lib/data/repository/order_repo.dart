import 'package:breadly/data/API/api_client.dart';
import 'package:breadly/models/place_order_model.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:get/get.dart';

class OrderRepo{
  ApiClient apiClient;
  OrderRepo ({
    required this.apiClient
  });

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async{
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI,placeOrder.toJson());
  }
}