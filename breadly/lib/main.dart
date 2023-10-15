import 'package:breadly/MainScreen.dart';
import 'package:breadly/controllers/mainscreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (contex)=>MainScreenNotifier())
    ],
    child: MaterialApp(
      initialRoute: '/',
  routes: {
    '/':(context) => const MainScreen(),
  },
    ),
    )
);
