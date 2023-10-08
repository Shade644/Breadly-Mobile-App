import 'package:flutter/material.dart';

import 'HomePage.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => const HomePage(),
  },
));