import 'package:breadly/base/custom_loader.dart';
import 'package:breadly/base/show_message.dart';
import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/pages/auth/singup_page.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/app_text_fild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

        void _login(AuthController authController){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty){
        showMessage("Wpisz Adres Email",title: "Email");
      }
      else if(!GetUtils.isEmail(email)){
      showMessage("Wpisz Poprawy Adres Email",title: "Niepoprawy adres Email");
      
      }else if(password.isEmpty){
        showMessage("Wpisz Hasło",title: "Hasło");
      }
      else{
      showMessage("Brak błędów",title: "OK");

        authController.login(email,password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
            print("success");
          }
          else{
            showMessage(status.message);
          }
        });
      }
    }

    return Scaffold(
      body:GetBuilder<AuthController>(builder:(authController){
        return !authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
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
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Witaj",
                      style: TextStyle(
                        fontSize: Dimensions.font20*3,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    Text(
                      "Zaloguj się do swojego konta!",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color:Colors.grey[500],
                      ),
                      ),
                ],)
              ),
            SizedBox(height: Dimensions.height20,),
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
              isObscure: true,
            ),
            SizedBox(height: Dimensions.height20,),
            GestureDetector(
              onTap: (){
                _login(authController);
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.blueAccent
                ),
                child: Center(
                  child: BigText(
                    text: "Zaloguj się!",
                    size: Dimensions.font20*1.2,
                    color: Colors.white,
                    ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height15,),
              RichText(
              text: TextSpan(
                text: " Nie masz konta? ",
                style: TextStyle(
                  color:Colors.black38,
                  fontSize: Dimensions.font16,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer(
      
                    )..onTap=()=>Get.to(()=>SingUpPage(), transition: Transition.fade),
                text: "Stwórz je",
                style: TextStyle(
                  color:Colors.black38,
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.bold,
                ),
                  )
                ]
              )
              ),
        
        
            ],),
        ):CustomLoader();
      }
      )
    );
  }
}