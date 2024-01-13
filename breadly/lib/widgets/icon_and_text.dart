import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:flutter/cupertino.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconText({super.key, 
  required this.icon, 
  required this.text, 
  required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color:iconColor,size:Dimensions.icon24),
        const SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}