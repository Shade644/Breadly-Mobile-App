import 'package:breadly/controllers/mainscreen_provider.dart';
import 'package:breadly/ui/cartpage.dart';
import 'package:breadly/ui/home.dart';
import 'package:breadly/ui/profile.dart';
import 'package:breadly/ui/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
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

    
      bottomNavigationBar: SafeArea(
        child:  Padding(padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             BotomNavWidget(
              onTap: () {
                mainScreenNotifier.pageIndex = 0;
              },icon: Ionicons.home,
            ),
             BotomNavWidget(
              onTap: () {
                 mainScreenNotifier.pageIndex = 1;
              },icon: Ionicons.search,
            ),
             BotomNavWidget(
              onTap: () {
                 mainScreenNotifier.pageIndex = 2;
              },icon: Ionicons.add,
            ),
             BotomNavWidget(
              onTap: () {
                 mainScreenNotifier.pageIndex = 3;
              },icon: Ionicons.cart,
            ),
             BotomNavWidget(
              onTap: () {
                 mainScreenNotifier.pageIndex = 4;
              },icon: Ionicons.person,
            ),
          ],
        ),
      ),
      )
      )
      );
    }
  );   
  }
}
