import 'package:breadly/pages/food/detail.dart';
import 'package:breadly/pages/food/recommeended.dart';
import 'package:breadly/pages/home/main_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
   static const String recommendedFood="/recommeended-food";

  static String getInitial()=>'$initial';
  static String getDetailFood(int pageID)=>'$popularFood?pageID=$pageID';
  static String getRecommendedFood(int pageID)=>'$recommendedFood?pageID=$pageID';

  static List<GetPage> routes =[

    GetPage(name: initial, page: ()=>MainPage()),

    GetPage(name: popularFood, page: (){
      var pageID = Get.parameters['pageID']; 
      return DetailFood(pageID : int.parse(pageID!));
    },
  transition: Transition.fadeIn
    ),
        GetPage(name: recommendedFood, page: (){
          var pageID = Get.parameters['pageID']; 
              return RecommenededFood(pageID : int.parse(pageID!));
    },
  transition: Transition.fadeIn
    ),

  ];
}