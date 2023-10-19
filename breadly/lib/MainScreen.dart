import 'package:breadly/controllers/mainscreen_provider.dart';
import 'package:breadly/ui/cartpage.dart';
import 'package:breadly/ui/home.dart';
import 'package:breadly/ui/profile.dart';
import 'package:breadly/ui/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'BottomNav.dart';
import 'bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> pageList  = const [
    HomePage(),
    Searchpage(),
    HomePage(),
    Cartpage(),
    Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {

  return Consumer<MainScreenNotifier>(
    builder:( context, mainScreenNotifier, child){
     return  Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
    body: pageList[mainScreenNotifier.pageIndex],

    
      bottomNavigationBar: const BottomNav()
      );
    }
  );   
  }
}

