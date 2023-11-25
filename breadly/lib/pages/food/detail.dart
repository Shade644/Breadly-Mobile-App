import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/pages/cart/cart_page.dart';
import 'package:breadly/pages/home/main_page.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/app_column.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/Big_text.dart';
import '../../widgets/Small_text.dart';
import '../../widgets/icon_and_text.dart';

class DetailFood extends StatelessWidget {
  final int pageID;
  final String page;
  DetailFood({super.key, required this.pageID, required this.page});


  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageID];
  Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         Positioned(
          left: 0,
          right: 0,

          child: Container(
            width: double.maxFinite,
            height: Dimensions.detailImgSize,
            decoration:  BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL+AppConstants.UPLOUD_URL+product.img!
                ),
              ),
            ),
         ),
         ),
         Positioned(
          top:Dimensions.height50,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if(page == "cartpage"){
                    Get.toNamed(RouteHelper.getCartPage());
                  }
                  else{
                    Get.toNamed(RouteHelper.getInitial());                    
                  }
                },
                child: AppIcon(icon: Icons.arrow_back_ios)),
              
             GetBuilder<PopularProductController>(builder: (controller){
              return GestureDetector(
                onTap: (){
                  if(controller.totalItems >=1) {
                    Get.toNamed(RouteHelper.cartPage);
                  }
                },
                child: Stack(
                  children: [
                     AppIcon(icon: Icons.shopping_cart_outlined),
                    controller.totalItems >=1?
                     Positioned(
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
         ],)),
         Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.detailImgSize-20,
          child: Container(
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top:Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(Dimensions.radius20),
                topLeft:Radius.circular(Dimensions.radius20),
                ),
              color: Colors.white,
            ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                     AppColumn(text:product.name!),
                     SizedBox(height: Dimensions.height20),
                    BigText(text: "Opis"),
                    SizedBox(height: Dimensions.height20),
                     Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text: product.description!,
                          )
                          ),
                    )
                 ],
               ),
          ),
        ),
         ],
         ),
         bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
           decoration: BoxDecoration(
            color: Color.fromARGB(134, 196, 196, 196),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),
            )
           ),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color:Colors.white
                ),
                child: Row(
                  children: [
                     GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                      Icons.remove, color: Colors.black
                      )),
                    SizedBox(width: Dimensions.width10/2),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                      Icons.add, color: Colors.black
                      )),
                ],)
              ),
              GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                child: Container(
                  padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(
                      text: "${product.price!} zł | Do Koszyka",
                      color: Colors.white
                      ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.blueAccent,
                  ),
                ),
              )
           ]));
  })
         );
  }
}