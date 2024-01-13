import 'package:breadly/base/custom_loader.dart';
import 'package:breadly/base/show_message.dart';
import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/models/signup_model.dart';
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
    var surnameController = TextEditingController();    
    var phoneController = TextEditingController();
    var singUpIMG = [
      "google.png",
      "facebook.png",
      "twitter.jpeg",
    ];

    void registration(AuthController authController){
      String name = nameController.text.trim();
      String surname = surnameController.text.trim();      
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showMessage("Wpisz Imię",title: "Imię");
      }
      else if(phone.isEmpty){
        showMessage("Wpisz Numer Telefonu",title: "Numer Telefonu");
      } 
      else if(phone.length<9){
        showMessage("Niepoprawny Numer Telefonu",title: "Numer Telefonu");
      }
      else if(email.isEmpty){
        showMessage("Wpisz Adres Email",title: "Email");
      }
      else if(!GetUtils.isEmail(email)){
      showMessage("Wpisz Poprawy Adres Email",title: "Niepoprawy adres Email");
      
      }else if(password.isEmpty){
        showMessage("Wpisz Hasło",title: "Hasło");
      }
      else if(password.length<8){
        showMessage("Hasło nie może być krótsze niż 8 znaków",title: "Krótkie hasło");
      }
      else{
      showMessage("Brak błędów",title: "OK");
      SignUpBody signUpBody = SignUpBody(
        name: name, 
        surname: surname,         
        phone: phone, 
        email: email, 
        password: password,       
        );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("success");
          }
          else{
            showMessage(status.message);
          }
        });
      }
    }

    return Scaffold(
      body:GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.06,),
              SizedBox(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    radius: Dimensions.radius20*4,
                    backgroundImage: const AssetImage(
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
              isObscure: true,
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextFild(
              textController: nameController,
              hintText: "Imię",
              icon:Icons.person,
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextFild(
              textController: surnameController,
              hintText: "Nazwisko",
              icon:Icons.person,
            ),            
            SizedBox(height: Dimensions.height20,),
            AppTextFild(
              textController: phoneController,
              hintText: "Numer Telefonu",
              icon:Icons.phone_android,
            ),
            SizedBox(height: Dimensions.height20,),
            GestureDetector(
              onTap:() {
                registration(authController);
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
                    text: "Zarejestruj się!",
                    size: Dimensions.font20*1.2,
                    color: Colors.white,
                    ),
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
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(
              text: TextSpan(
                text: "Zaloguj się przy użyciu",
                style: TextStyle(
                  color:Colors.black38,
                  fontSize: Dimensions.font16/1.1,
                )
              )
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundImage: AssetImage(
                      "assets/images/${singUpIMG[index]}"
                    ),
                  ),
                )),
              )
        
        
            ],),
        ):const CustomLoader();
        }
      ),
    );
  }
}