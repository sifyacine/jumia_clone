import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../filtering/brand_filter.dart';
import '../../filtering/price_filter.dart';
import '../seller_profile/seller_profile.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({Key? key, required this.sellerName}) : super(key: key);
  final String sellerName;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: TAppBar(
        title: Text(sellerName, style: const TextStyle(color: Colors.white)),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => SellerProfile(
                    sellerName: sellerName,
                  ));
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: isDark ? TColors.kBlack : TColors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: sellerName,
                      ),
                      const Icon(Iconsax.arrow_right_3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "87% seller score",
                            style: TextStyle(
                              color: isDark ? TColors.light : TColors.dark,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "6789 Followers",
                            style: TextStyle(
                              color: isDark ? TColors.light : TColors.dark,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      // Improved Follow Button
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: TColors.primaryColor,
                          // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4.0),
                          // Padding

                          side: const BorderSide(
                            color: TColors.primaryColor, // Border color
                          ),
                        ),
                        child: const Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: isDark ? TColors.kBlack : TColors.white,
            width: double.infinity,
            child: Image.asset('assets/images/products/ads_image.jpg'),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: isDark ? TColors.kBlack : TColors.white,
            width: double.infinity,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Allows the bottom sheet to take a custom height
                      builder: (BuildContext context) {
                        return const BrandFilter();
                      },
                    );

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    color: isDark ? TColors.dark : TColors.light,
                    child: Row(
                      children: [
                        const Text("Brand"), // Added const for better performance
                        const SizedBox(width: 6.0), // Added const for better performance
                        Icon(
                          Iconsax.arrow_down_1, // Changed to a standard dropdown arrow icon
                          size: 18.0,
                          color: isDark ? TColors.white : TColors.kBlack,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Allows the bottom sheet to take a custom height
                      builder: (BuildContext context) {
                        return const PriceFilter();
                      },
                    );

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    color: isDark ? TColors.dark : TColors.light,
                    child: Row(
                      children: [
                        const Text("Price"), // Added const for better performance
                        const SizedBox(width: 6.0), // Added const for better performance
                        Icon(
                          Iconsax.arrow_down_1, // Changed to a standard dropdown arrow icon
                          size: 18.0,
                          color: isDark ? TColors.white : TColors.kBlack,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
