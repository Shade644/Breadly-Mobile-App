import 'package:breadly/pages/auth/singin_page.dart';
import 'package:breadly/pages/cart/cart_page.dart';
import 'package:breadly/pages/food/detail.dart';
import 'package:breadly/pages/food/recommeended.dart';
import 'package:breadly/pages/home/home_page.dart';
import 'package:breadly/pages/home/main_page.dart';
import 'package:breadly/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
   static const String recommendedFood="/recommeended-food";
   static const String cartPage = "/cart-page";
   static const String splashPage = "/splash-page";
  static const String singIn = "/sing-in";

  static String getInitial()=>'$initial';
  static String getDetailFood(int pageID, String page)=>'$popularFood?pageID=$pageID&page=$page';
  static String getRecommendedFood(int pageID,String page)=>'$recommendedFood?pageID=$pageID&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';
  static String getSingInPage() => '$singIn';  

  static List<GetPage> routes =[

    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: singIn, page: ()=>SingInPage(),transition: Transition.fade),    

    GetPage(name: popularFood, page: (){
      var pageID = Get.parameters['pageID'];
      var page = Get.parameters['page'];
      return DetailFood(pageID : int.parse(pageID!),page:page!);
    },
  transition: Transition.fadeIn
    ),
        GetPage(name: recommendedFood, page: (){
          var pageID = Get.parameters['pageID']; 
           var page = Get.parameters['page'];          
              return RecommenededFood(pageID : int.parse(pageID!), page:page!);
    },
  transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page:(){
      return CartPage();
    },
    transition: Transition.fadeIn
    ),

  ];
}