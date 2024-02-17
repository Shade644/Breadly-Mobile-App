import 'package:breadly/base/custom_loader.dart';
import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/controllers/user_controller.dart';
import 'package:breadly/pages/person/no_logged_in.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:breadly/widgets/person_widge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(userLoggedIn){
      print("konto zalogowane");
      Get.find<UserController>().getUserInfo();
    }

    String _formatDateTime(String dateTimeString) {
      DateTime dateTime = DateTime.parse(dateTimeString);
      String formattedDateTime = DateFormat('dd-MM-yyyy HH:mm:ss').format(dateTime);
      return formattedDateTime;
}
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
      body: GetBuilder<UserController>(builder:(userController){
        return userLoggedIn?(userController.isLoading?Container(
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
                          text: "${userController.userModel.name} ${userController.userModel.surname}",
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
                          text: userController.userModel.phone.toString(),
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
                          text: userController.userModel.email,
                        )),
                    SizedBox(height: Dimensions.height10),
                    PersonWidget(
                        appIcon: AppIcon(
                          icon: Icons.timer_outlined,
                          backgroundColor: Colors.blueAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height30,
                          size: Dimensions.height50,
                        ),
                        bigText: BigText(
                          text:"Członek od: "+_formatDateTime(userController.userModel.created),
                        )),
                    SizedBox(height: Dimensions.height10),
                    GestureDetector(
                      onTap: (){
                       print("Zalogowano");
                        if(Get.find<AuthController>().userLoggedIn()){
                        Get.find<AuthController>().clearSharedData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSingInPage());
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
                            text: "Wyloguj Się!",
                          )),
                    ),
                    SizedBox(height: Dimensions.height10),
                  ]),
                ))
              ],
            ),  
        ):const CustomLoader()):const NoLoggedIn();
        }
      ),
    );
  }
}
