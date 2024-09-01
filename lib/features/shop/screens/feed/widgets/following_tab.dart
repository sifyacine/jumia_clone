import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumia_clone/features/shop/screens/feed/widgets/seller_card.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../all_products/all_products.dart';
import 'explore_card_widget.dart';

class FollowingTab extends StatelessWidget {
  const FollowingTab({super.key});

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
              CustomSellerCard(
                  labelText: 'popular seller',
                  mainText: 'Braun Official store',
                  imageUrls: [
                    TImages.productImage12,
                    TImages.productImage5,
                    TImages.productImage16,
                  ],
                  footerText: 'discover latest products',
                  onTap: () {
                    Get.to(() => AllProducts());
                  }, time: '9 hours',),
              CustomSellerCard(
                labelText: 'popular seller',
                mainText: 'Nike fficial store',
                imageUrls: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
                footerText: 'discover latest products',
                onTap: () {
                  Get.to(() => AllProducts());
                }, time: '9 hours',),
            ],
          ),
        ),
      ),
    );
  }
}
