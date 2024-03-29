import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/models/cart_model.dart';
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
      print("Produkt: "+_popularProductList.toString());
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
    if((_inCartItems+quantity)<0){
      Get.snackbar("Błąd", "Dodaj przynajmniej jeden produkt do koszyka");
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }
    else if((_inCartItems+quantity)>20){
       Get.snackbar("Błąd", "Dodaj przynajmniej jeden produkt do koszyka");
      return 20;
    }
    else {
      return quantity;
    }
  }
  void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart = cart;
    var exist=false;
    exist = _cart.existInCart(product);
    print(exist.toString());
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    print("quantity $_inCartItems");
  }
  void addItem(ProductModel product){
    _cart.addItem(product, _quantity);
    _quantity=0;
    _inCartItems = _cart.getQuantity(product);
    
    _cart.items.forEach((key, value) {
      print("ID: ${value.id} Quantity: ${value.quantity}");
    });
    update();
    }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
  }
