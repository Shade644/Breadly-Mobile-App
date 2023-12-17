import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/app_text_fild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: Dimensions.screenHeight*0.06,),
          Container(
            height: Dimensions.screenHeight*0.25,
            child: Center(
              child: CircleAvatar(
                radius: Dimensions.radius20*4,
                backgroundImage: AssetImage(
                  "assets/images/logo.png"
                ),
              ),
            ),
          ),
        AppTextFild(
          textController: emailController,
          hintText: "Podaj adres email",
          icon:Icons.email,
        ),
        SizedBox(height: Dimensions.height20,),
        AppTextFild(
          textController: passwordController,
          hintText: "Hasło",
          icon:Icons.password,
        ),
        SizedBox(height: Dimensions.height20,),
        AppTextFild(
          textController: nameController,
          hintText: "Imię",
          icon:Icons.person,
        ),
        SizedBox(height: Dimensions.height20,),
        AppTextFild(
          textController: phoneController,
          hintText: "Numer Telefonu",
          icon:Icons.phone_android,
        ),
        SizedBox(height: Dimensions.height20,),
        Container(
          width: Dimensions.screenWidth/2,
          height: Dimensions.screenHeight/13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: Colors.blueAccent
          ),
          child: Center(
            child: BigText(
              text: "Zarejestruj się!",
              size: Dimensions.font20*1.2,
              color: Colors.white,
              ),
          ),
        ),
        SizedBox(height: Dimensions.height10,),
        RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer(

            )..onTap=()=>Get.back(),
            text: "Masz już konto?",
            style: TextStyle(
              color:Colors.black38,
              fontSize: Dimensions.font16/1.1,
            )
          )
          )

        ],),
    );
  }
}