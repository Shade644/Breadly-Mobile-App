import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/person_widge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: BigText(
            text: "Informacje Użytkownika",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: Colors.blueAccent,
              iconColor: Colors.white,
              iconSize: Dimensions.height15 * 5,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height20),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                PersonWidget(
                    appIcon: AppIcon(
                      icon: Icons.person,
                      backgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height30,
                      size: Dimensions.height50,
                    ),
                    bigText: BigText(
                      text: "Adam",
                    )),
                SizedBox(height: Dimensions.height10),
                PersonWidget(
                    appIcon: AppIcon(
                      icon: Icons.phone_android,
                      backgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height30,
                      size: Dimensions.height50,
                    ),
                    bigText: BigText(
                      text: "123456789",
                    )),
                SizedBox(height: Dimensions.height10),
                PersonWidget(
                    appIcon: AppIcon(
                      icon: Icons.email_sharp,
                      backgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height30,
                      size: Dimensions.height50,
                    ),
                    bigText: BigText(
                      text: "Adamadamowy@gmail.com",
                    )),
                SizedBox(height: Dimensions.height10),
                PersonWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on,
                      backgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height30,
                      size: Dimensions.height50,
                    ),
                    bigText: BigText(
                      text: "Adres",
                    )),
                SizedBox(height: Dimensions.height10),
                GestureDetector(
                  onTap: (){
                   print("Zalogowano");
                    if(Get.find<AuthController>().userLoggedIn()){
                    Get.find<AuthController>().clearSharedData();
                    Get.find<CartController>().clear();
                    Get.find<CartController>().clearCartHistory();
                    Get.offNamed(RouteHelper.getInitial());
                    }
                    else{
                      print("Nie zalogowano");
                    }
                  },
                  child: PersonWidget(
                      appIcon: AppIcon(
                        icon: Icons.logout_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height30,
                        size: Dimensions.height50,
                      ),
                      bigText: BigText(
                        text: "Logout",
                      )),
                ),
                SizedBox(height: Dimensions.height10),
                PersonWidget(
                    appIcon: AppIcon(
                      icon: Icons.logout_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height30,
                      size: Dimensions.height50,
                    ),
                    bigText: BigText(
                      text: "?",
                    )),
              ]),
            ))
          ],
        ),
      ),
    );
  }
}
