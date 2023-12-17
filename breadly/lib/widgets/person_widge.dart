import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:flutter/material.dart';


class PersonWidget extends StatelessWidget {
 AppIcon appIcon;
 BigText bigText;

 PersonWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.height10,
        bottom: Dimensions.height10,
        ),
        child: Row(
          children: [
            appIcon,
            SizedBox(width: Dimensions.width20),
            bigText,
        ],),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 2),
              color: Colors.grey.withOpacity(0.2)
            )
          ]
        ),
    );
  }
}