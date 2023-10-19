import 'package:breadly/MainScreen.dart';
import 'package:breadly/bottom_nav.dart';
import 'package:breadly/controllers/mainscreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child){
    return SafeArea(
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
    );
      }
    );
    }
    }