import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/pages/cart/cart_page.dart';
import 'package:breadly/pages/food/detail.dart';
import 'package:breadly/pages/food/recommeended.dart';
import 'package:breadly/pages/home/page_body.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home/main_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,    
     initialRoute: RouteHelper.getInitial(),
     getPages: RouteHelper.routes,
    );
  }
}