import 'package:breadly/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:breadly/models/product_model.dart';


class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  List<dynamic> _filteredProductList = [];
  Map<String, int> _productIndices = {};

  List<dynamic> get filteredProductList => _filteredProductList;
  bool _isLoaded =  false;
  bool get isLoaded => _isLoaded;

    int findIndexByName(String name) {
    return _productIndices[name] ?? -1;
  }
  
  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print(_recommendedProductList);
      _isLoaded = true;
      update();
    }
    else {
      print("error");
    }
  }

void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProductList = List.from(_recommendedProductList);
    } else {
      _filteredProductList = _recommendedProductList
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      _filteredProductList.forEach((product) {
        int index = _recommendedProductList.indexOf(product);
        _productIndices[product.name!] = index;
      });
    }

    update();
  }
}