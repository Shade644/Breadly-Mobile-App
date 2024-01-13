import 'package:breadly/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20*5/2),
          color: Colors.blueAccent,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}