import 'package:flutter/material.dart';


class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text("Search Page"),
      ),
    );
  }
}