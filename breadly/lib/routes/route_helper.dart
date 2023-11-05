import 'package:breadly/pages/food/detail.dart';
import 'package:breadly/pages/home/main_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";

  static String getDetailFood()=>'$popularFood';

  static List<GetPage> routes =[
    GetPage(name: "/" ,page: ()=>MainPage()),
    GetPage(name: popularFood, page: ()=>DetailFood()),

  ];
}