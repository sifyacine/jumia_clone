import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../all_products/all_products.dart';
import 'explore_card_widget.dart';

class ExploringTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Container(
        color: isDark ? TColors.dark : TColors.light,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomCard(
                  labelText: 'new products',
                  mainText: 'discover our new products',
                  imageUrls: [
                    TImages.productImage1,
                    TImages.productImage2,
                    TImages.productImage3,
                  ],
                  footerText: '9 h ago',
                  onTap: () {
                    Get.to(() => AllProducts());
                  }),
              CustomCard(
                  isBlueContainer: false,
                  labelText: "today's offer",
                  mainText: 'discover our offers',
                  imageUrls: [
                    TImages.productImage4,
                    TImages.productImage5,
                    TImages.productImage6,
                  ],
                  footerText: '9 h ago',
                  onTap: () {
                    Get.to(() => AllProducts());
                  }),
              CustomCard(
                  labelText: 'new products',
                  mainText: 'discover our new products',
                  imageUrls: [
                    TImages.productImage7,
                    TImages.productImage8,
                    TImages.productImage9,
                  ],
                  footerText: '9 h ago',
                  onTap: () {
                    Get.to(() => AllProducts());
                  }),
              CustomCard(
                  isBlueContainer: false,
                  labelText: "today's offer",
                  mainText: 'discover our offers',
                  imageUrls: [
                    TImages.productImage11,
                    TImages.productImage12,
                    TImages.productImage13,
                  ],
                  footerText: '9 h ago',
                  onTap: () {
                    Get.to(() => AllProducts());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
