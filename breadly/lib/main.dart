import 'package:breadly/pages/food/detail.dart';
import 'package:breadly/pages/food/recommeended.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home/main_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MainPage(),
      // home: DetailFood(),
      home: RecommenededFood(),
    );
  }
}