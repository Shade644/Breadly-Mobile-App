import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/Big_text.dart';

class RecommenededFood extends StatelessWidget {
  final int pageID;
  final String page;
   const RecommenededFood({super.key, required this.pageID, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageID];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: (){
                  if(page == "cartpage"){
                    Get.toNamed(RouteHelper.getCartPage());
                  }
                  else{
                    Get.toNamed(RouteHelper.getInitial());                    
                  }
                },
                child:  const AppIcon(icon: Icons.clear),
              ),
             GetBuilder<PopularProductController>(builder: (controller){
              return GestureDetector(
                  onTap: (){
                  if(controller.totalItems >=1) {
                    Get.toNamed(RouteHelper.cartPage);
                  }
                },
                child: Stack(
                  children: [
                     const AppIcon(icon: Icons.shopping_cart_outlined),
                     controller.totalItems >=1?
                     const Positioned(
                      right: 0,
                      top:0,
                         child: AppIcon(icon: Icons.circle, 
                         size: 20, 
                         iconColor: Colors.transparent, 
                         backgroundColor: Color.fromARGB(255, 249, 100, 100),
                         ),
                     ):
                     Container(),
                     Get.find<PopularProductController>().totalItems >=1?
                     Positioned(
                      right: 6,
                      top:3,
                       child: BigText(
                        text:Get.find<PopularProductController>().totalItems.toString(),
                       size: 12,
                       color: Colors.white,
                       ),
                     ):
                     Container(),                   
                     
                     
                  ],
                ),
              ); 
             },)
                ],
              ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top:5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
                child: Center(
                  child: BigText(size:Dimensions.font26, text: product.name!)
                  ),
              )
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 102, 149, 26),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
                ),
            ),
          ),
           SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text: product.description!,
                    ),
                )
            ],)
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                 bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                    iconSize: Dimensions.icon24,
                    iconColor:Colors.white,
                    backgroundColor: Colors.blueAccent, 
                    icon: Icons.remove
                    ),
                  ),
                     BigText(text: "${product.price!} zł"" x " "${controller.inCartItems} ",size:Dimensions.font26),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                    iconSize: Dimensions.icon24,
                    iconColor:Colors.white,
                    backgroundColor: Colors.blueAccent, 
                    icon: Icons.add
                    ),
                  )
                ],
              ),
            ),
             Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
           decoration: BoxDecoration(
            color: const Color.fromARGB(134, 196, 196, 196),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),
            )
           ),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.height20,right: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color:Colors.white
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller.addItem(product);
                },
                child: Container(
                padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.blueAccent,
                ),
                 child: BigText(text: " ${product.price!} zł | Do Koszyka",color: Colors.white),
              ),
              )
           ]),
           ),
        ]);
      }
      ),
    );
  }
}