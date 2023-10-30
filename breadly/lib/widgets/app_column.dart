import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'Big_text.dart';
import 'Small_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            BigText(text: text, size: Dimensions.font26,),
            SizedBox(height:Dimensions.height10,),
            Row(children: [
              Wrap(
                children: List.generate(5, (index) => const Icon(Icons.star,color:Colors.amberAccent,size: 18,))
              ),
               SizedBox(width:Dimensions.width10,),
              SmallText(text: "4.5"),
               SizedBox(width: Dimensions.width10,),
              SmallText(text: "30"),
              SizedBox(width: Dimensions.width1,),
              SmallText(text: "Ocen"),
            ],),
             SizedBox(height: Dimensions.height20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
              IconText(
                icon: Icons.circle_sharp, 
                text: "Normal", 
                iconColor: Colors.orange
                ),
                  IconText(
                icon: Icons.location_on, 
                text: "1,7 km", 
                iconColor: Colors.green
                ),
                  IconText(
                icon: Icons.access_time_rounded, 
                text: "32min", 
                iconColor: Colors.redAccent
                ),
            ],)
    
          ]);
  }
}