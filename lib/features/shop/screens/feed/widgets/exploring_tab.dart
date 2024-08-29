import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../all_products/all_products.dart';
import 'explore_card_widget.dart';


class ExploringTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Container(
        color: isDark? TColors.dark : TColors.light,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
           children: [
             CustomCard(labelText: 'new products', mainText: 'discover our new products', imageUrls: ["assets/images/products/samsung-s23-mobile-white-back.png", "assets/images/products/nike air jordar 4 single orange.jpg", "assets/images/products/nike air jordar 4 single blue.jpg"], footerText: '9 h ago', onTap: (){Get.to(() => AllProducts());}),
             CustomCard(isBlueContainer: false, labelText: "today's offer", mainText: 'discover our offers', imageUrls: ["assets/images/products/samsung-s23-mobile-white-back.png", "assets/images/products/nike air jordar 4 single orange.jpg", "assets/images/products/nike air jordar 4 single blue.jpg"], footerText: '9 h ago', onTap: (){Get.to(() => AllProducts());}),
             CustomCard(labelText: 'new products', mainText: 'discover our new products', imageUrls: ["assets/images/products/samsung-s23-mobile-white-back.png", "assets/images/products/nike air jordar 4 single orange.jpg", "assets/images/products/nike air jordar 4 single blue.jpg"], footerText: '9 h ago', onTap: (){Get.to(() => AllProducts());}),
             CustomCard(isBlueContainer: false, labelText: "today's offer", mainText: 'discover our offers', imageUrls: ["assets/images/products/samsung-s23-mobile-white-back.png", "assets/images/products/nike air jordar 4 single orange.jpg", "assets/images/products/nike air jordar 4 single blue.jpg"], footerText: '9 h ago', onTap: (){Get.to(() => AllProducts());}),

           ],
          ),
        ),
      ),
    );
  }
}