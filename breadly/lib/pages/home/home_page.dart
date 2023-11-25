import 'package:breadly/pages/home/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainPage(),
    Container(
      child: Center(
        child: Text("Next")
        ),
    ),
    Container(
      child: Center(
        child: Text("Next 2")
        ),
    ),  
    Container(
      child: Center(
        child: Text("Next 3")
        ),
    ),        
  ];

        void onTapNav(int index){
         setState(() {
           _selectedIndex = index;
         });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:("home"), 
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.archive),
          label:("history"), 
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label:("cart"), 
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:("me"), 
          )
      ]),
    );
  }
}