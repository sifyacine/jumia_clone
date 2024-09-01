import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
class SellerScore extends StatelessWidget {
  const SellerScore({
  super.key, required this.text, required this.result,
  });
  final String text;
  final String result;



  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.0), // Adds some padding inside the container
          decoration: BoxDecoration(
            color: Colors.green, // Sets the background color to green
            shape: BoxShape.circle, // Makes the container a circle
          ),
          child: Icon(
            Icons.star,
            size: 12.0, // Sets the size of the icon
            color: Colors.white, // Sets the color of the icon to white
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(
            color: isDark ? TColors.light : TColors.dark,
            fontSize: 14,
          ),
        ),
        Text(
          result,
          style: TextStyle(
              color: isDark ? TColors.light : TColors.dark,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
