import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/Big_text.dart';

class RecommenededFood extends StatelessWidget {
  const RecommenededFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
            ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(size:Dimensions.font26, text: "Pączki")
                  ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
              )
            ),
            pinned: true,
            backgroundColor: Color.fromARGB(255, 102, 149, 26),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/paczek.jpg",
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
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet. Vitae nunc sed velit dignissim sodales. Posuere lorem ipsum dolor sit amet. Lacus laoreet non curabitur gravida arcu ac tortor. Dui vivamus arcu felis bibendum ut tristique et egestas. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Tincidunt augue interdum velit euismod in pellentesque massa. Metus dictum at tempor commodo ullamcorper a. Ipsum suspendisse ultrices gravida dictum fusce ut. Tincidunt augue interdum velit euismod in pellentesque massa. Volutpat ac tincidunt vitae semper quis lectus nulla at. Aliquet eget sit amet tellus cras. Quis blandit turpis cursus in. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. At tellus at urna condimentum. Pharetra vel turpis nunc eget lorem dolor sed. Maecenas pharetra convallis posuere morbi leo. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Sed turpis tincidunt id aliquet risus. Eget gravida cum sociis natoque penatibus et magnis dis. Diam quis enim lobortis scelerisque fermentum. Sodales ut etiam sit amet nisl purus. Enim blandit volutpat maecenas volutpat blandit. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Enim diam vulputate ut pharetra sit amet.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet. Vitae nunc sed velit dignissim sodales. Posuere lorem ipsum dolor sit amet. Lacus laoreet non curabitur gravida arcu ac tortor. Dui vivamus arcu felis bibendum ut tristique et egestas. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Tincidunt augue interdum velit euismod in pellentesque massa. Metus dictum at tempor commodo ullamcorper a. Ipsum suspendisse ultrices gravida dictum fusce ut. Tincidunt augue interdum velit euismod in pellentesque massa. Volutpat ac tincidunt vitae semper quis lectus nulla at. Aliquet eget sit amet tellus cras. Quis blandit turpis cursus in. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. At tellus at urna condimentum. Pharetra vel turpis nunc eget lorem dolor sed. Maecenas pharetra convallis posuere morbi leo. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Sed turpis tincidunt id aliquet risus. Eget gravida cum sociis natoque penatibus et magnis dis. Diam quis enim lobortis scelerisque fermentum. Sodales ut etiam sit amet nisl purus. Enim blandit volutpat maecenas volutpat blandit. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Enim diam vulputate ut pharetra sit amet.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet. Vitae nunc sed velit dignissim sodales. Posuere lorem ipsum dolor sit amet. Lacus laoreet non curabitur gravida arcu ac tortor. Dui vivamus arcu felis bibendum ut tristique et egestas. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Tincidunt augue interdum velit euismod in pellentesque massa. Metus dictum at tempor commodo ullamcorper a. Ipsum suspendisse ultrices gravida dictum fusce ut. Tincidunt augue interdum velit euismod in pellentesque massa. Volutpat ac tincidunt vitae semper quis lectus nulla at. Aliquet eget sit amet tellus cras. Quis blandit turpis cursus in. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. At tellus at urna condimentum. Pharetra vel turpis nunc eget lorem dolor sed. Maecenas pharetra convallis posuere morbi leo. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Sed turpis tincidunt id aliquet risus. Eget gravida cum sociis natoque penatibus et magnis dis. Diam quis enim lobortis scelerisque fermentum. Sodales ut etiam sit amet nisl purus. Enim blandit volutpat maecenas volutpat blandit. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Enim diam vulputate ut pharetra sit amet.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet. Vitae nunc sed velit dignissim sodales. Posuere lorem ipsum dolor sit amet. Lacus laoreet non curabitur gravida arcu ac tortor. Dui vivamus arcu felis bibendum ut tristique et egestas. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer. Tincidunt augue interdum velit euismod in pellentesque massa. Metus dictum at tempor commodo ullamcorper a. Ipsum suspendisse ultrices gravida dictum fusce ut. Tincidunt augue interdum velit euismod in pellentesque massa. Volutpat ac tincidunt vitae semper quis lectus nulla at. Aliquet eget sit amet tellus cras. Quis blandit turpis cursus in. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. At tellus at urna condimentum. Pharetra vel turpis nunc eget lorem dolor sed. Maecenas pharetra convallis posuere morbi leo. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Sed turpis tincidunt id aliquet risus. Eget gravida cum sociis natoque penatibus et magnis dis. Diam quis enim lobortis scelerisque fermentum. Sodales ut etiam sit amet nisl purus. Enim blandit volutpat maecenas volutpat blandit. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Enim diam vulputate ut pharetra sit amet."
                    ),
                )
            ],)
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  iconSize: Dimensions.icon24,
                  iconColor:Colors.white,
                  backgroundColor: Colors.blueAccent,
                   icon: Icons.remove
                   ),
                   BigText(text: "6,99 zł"+" x "+"0",size:Dimensions.font26),
                AppIcon(
                  iconSize: Dimensions.icon24,
                  iconColor:Colors.white,
                  backgroundColor: Colors.blueAccent, 
                  icon: Icons.add
                  ),
              ],
            ),
          ),
           Container(
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
              padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.height20,right: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color:Colors.white
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.blueAccent,
              ),
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
      ]),
    );
  }
}