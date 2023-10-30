import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/app_column.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/Big_text.dart';
import '../../widgets/Small_text.dart';
import '../../widgets/icon_and_text.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({super.key});

  @override
  Widget build(BuildContext context) {
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage(
                "assets/images/paczek.jpg"
              )
              )
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
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined)
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
                    const AppColumn(text:"Chleb"),
                     SizedBox(height: Dimensions.height20),
                    BigText(text: "Opis"),
                    SizedBox(height: Dimensions.height20),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet. Vitae nunc sed velit dignissim sodales. Posuere lorem ipsum dolor sit amet. Lacus laoreet non curabitur gravida arcu ac tortor. Dui vivamus arcu felis bibendum ut tristique et egestas. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Tincidunt augue interdum velit euismod in pellentesque massa. Metus dictum at tempor commodo ullamcorper a. Ipsum suspendisse ultrices gravida dictum fusce ut. Tincidunt augue interdum velit euismod in pellentesque massa. Volutpat ac tincidunt vitae semper quis lectus nulla at. Aliquet eget sit amet tellus cras. Quis blandit turpis cursus in. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. At tellus at urna condimentum. Pharetra vel turpis nunc eget lorem dolor sed. Maecenas pharetra convallis posuere morbi leo. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Sed turpis tincidunt id aliquet risus. Eget gravida cum sociis natoque penatibus et magnis dis. Diam quis enim lobortis scelerisque fermentum. Sodales ut etiam sit amet nisl purus. Enim blandit volutpat maecenas volutpat blandit. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Enim diam vulputate ut pharetra sit amet."
                          )
                          ),
                    )
                 ],
               ),
          ),
        ),
         ],
         ),
         bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: Colors.black),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2),
                  Icon(Icons.add, color: Colors.black),
              ],)
            ),
            Container(
              padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
               child: BigText(text: "9,99 zł | Do Koszyka",color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.blueAccent,
              ),
            )
         ]),
         ),
         );
  }
}