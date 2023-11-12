import 'package:breadly/controllers/cart_controller.dart';
import 'package:get/get.dart';
import '../data/repository/popular_product_repo.dart';
import 'package:breadly/models/product_model.dart';


class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late  CartController _cart;

  bool _isLoaded =  false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems=> _inCartItems+_quantity;
  

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded = true;
      update();
    }
    else {
      print("error");
    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      print(_quantity.toString());
      _quantity = checkQuantity(_quantity+1);
    }
    else{
      print(_quantity.toString());
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Nie można zamówieć mniej niż zero", "Uspokuj się xD");
      return 0;
    }
    // po ilości z api do zrobienia
    else if(quantity>20){
       Get.snackbar("Nie można zamówieć więcej niż dwadzieścia", "Uspokuj się xD");
      return 20;
    }
    else {
      return quantity;
    }
  }
  void initProduct(CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart = cart;
  }
  void addItem(ProductModel product){
    if(quantity>0){
    _cart.addItem(product, _quantity);
    _quantity=0;
    _cart.items.forEach((key, value) {
      print("ID: "+value.id.toString()+" Quantity: "+value.quantity.toString());
    });
    }
    else{
     Get.snackbar("Brak przedmiotów w koszyku", "Musisz mieć przynajmniej jednek przedmiot w koszyku"); 
    }
  }
}