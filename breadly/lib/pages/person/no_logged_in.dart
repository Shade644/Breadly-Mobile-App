import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoLoggedIn extends StatelessWidget {
  const NoLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: Dimensions.height20*16,
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(
                      "assets/images/signin.png"
                    ),
                    
                    )
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getSingInPage());
                },
                child: Container(
                  
                  width: double.maxFinite,
                  height: Dimensions.height20*4,
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                 borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                  
                  child: Center(child: BigText(text: "Zaloguj się!", color: Colors.white,size: Dimensions.font20)),
                ),
              ),              
            ],
          )
        
        ),);
  }
}