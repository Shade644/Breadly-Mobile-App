import 'dart:async';

import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    super.initState();
    _loadResources();
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 2)
      )..forward();

    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.easeIn
      );
      Timer(
        const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial())
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 209, 87),
      body:ScaleTransition(
        scale: animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Image.asset("assets/images/logo.png")
        ],),
      )
    );
  }
}