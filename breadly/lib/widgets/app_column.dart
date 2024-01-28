import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'Big_text.dart';
import 'Small_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int stars;
  final int price;
  final int stock;

  const AppColumn({super.key, required this.text, required this.stars, required this.price, required this.stock});

  String formatStarsText(int stars) {
    return stars == 4 ? "Gwiazdki" : (stars == 5 ? "Gwiazdek" : "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  stars,
                  (index) => const Icon(Icons.star,
                      color: Colors.amberAccent, size: 18)),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: stars.toString()),
            SizedBox(width: Dimensions.width10),
            SmallText(text: formatStarsText(stars)),
          ],
        ),
        SizedBox(height: Dimensions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                IconText(
                    icon: Icons.money_sharp, 
                    text: price.toString()+ " zł", 
                    iconColor: Colors.green
                    ),
                IconText(
                    icon: Icons.cookie_outlined, 
                    text: stock.toString()+ " Sztuk", 
                    iconColor: const Color.fromARGB(255, 112, 53, 31)
                    ),
          ],
        )
      ],
    );
  }
}
