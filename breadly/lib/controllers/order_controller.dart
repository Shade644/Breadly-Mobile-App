import 'package:breadly/data/repository/order_repo.dart';
import 'package:breadly/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> placeOrders(PlaceOrderBody placeOrder) async {
    _isLoading.value = true;
    print("Order: $placeOrder");

    Response response = await orderRepo.placeOrder(placeOrder);

    if (response.status == 200) {
      _isLoading.value = false;
      print("Order placed successfully");
    } else {
      print("bląd: "+response.statusText!);

    }
  } 



  @override
  void onInit() {
    super.onInit();
    ever(_isLoading, (_) {
      update(); 
    });
  }
}
