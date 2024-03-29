import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  double height;
   SmallText({super.key, 
  this.color = const Color.fromARGB(255, 127, 122, 120), 
  required this.text,
  this.size=12,
  this.height=1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontFamily: 'Roboto',
        fontSize:size,
        height: height,
      ),
    );
  }
}