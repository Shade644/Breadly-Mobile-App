import 'package:breadly/pages/home/page_body.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:flutter/material.dart';
import '../../widgets/Big_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    body: Column(
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
            Center(
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