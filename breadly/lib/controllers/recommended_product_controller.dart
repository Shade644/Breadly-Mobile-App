import 'package:breadly/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:breadly/models/product_model.dart';


class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded =  false;
  bool get isLoaded => _isLoaded;
  

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){

      print("ok");
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
}