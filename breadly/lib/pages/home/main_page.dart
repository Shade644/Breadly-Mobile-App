import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/pages/Search/SearchPage.dart';
import 'package:breadly/pages/home/page_body.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/Big_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    
    return RefreshIndicator(
      onRefresh: _loadResources,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:Dimensions.height50, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(text:"Breadly"),
                  Row(
                    children: [
                    SmallText(text:"Bochnia", color: Colors.black54),
                    const Icon(Icons.arrow_drop_down)
                  ],)
    
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SearchPage());
                },
                child: Center(
                  child: Container(
                    width: Dimensions.height50,
                    height: Dimensions.height50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.blueAccent,
                
                    ),
                    child: Icon(Icons.search, color: Colors.white, size:Dimensions.icon24),
                  ),
                ),
              ),
            ],
            ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: PageBody(),
            ))
        
      ],
      ),
      
      );
  }
}