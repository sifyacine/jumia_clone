import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jumia_clone/features/shop/screens/sellers/seller_profile/widgets/product_pov_card.dart';
import 'package:jumia_clone/features/shop/screens/sellers/seller_profile/widgets/seller_score.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../product_details/product_details.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: const TAppBar(
        title: Text("Seller Profile", style: TextStyle(color: Colors.white)),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: isDark ? TColors.kBlack : TColors.white,
                child: Column(
                  children: [
                    const TSectionHeading(
                      title: 'Nike Official Store',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TSectionHeading(
                  title: "INFO",
                  textColor: isDark ? TColors.white : TColors.kDarkGrey,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                color: isDark ? TColors.kBlack : TColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Seller at HTA since: ",
                          style: TextStyle(
                            color: isDark ? TColors.light : TColors.dark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "3 months",
                          style: TextStyle(
                              color: isDark ? TColors.light : TColors.dark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "sold items: ",
                          style: TextStyle(
                            color: isDark ? TColors.light : TColors.dark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "+10000",
                          style: TextStyle(
                              color: isDark ? TColors.light : TColors.dark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "country: ",
                          style: TextStyle(
                            color: isDark ? TColors.light : TColors.dark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Algeria",
                          style: TextStyle(
                              color: isDark ? TColors.light : TColors.dark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                child: TSectionHeading(
                  title: "INFORMATION about the seller",
                  textColor: isDark ? TColors.white : TColors.kDarkGrey,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                color: isDark ? TColors.kBlack : TColors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TSectionHeading(title: "Seller's score"),
                        SizedBox(width: 12.0),
                        Icon(Icons.warning),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    SellerScore(
                      text: 'Delivery speed: ',
                      result: 'Excelent',
                    ),
                    SizedBox(height: 8.0),
                    SellerScore(
                      text: 'products quality: ',
                      result: 'Good',
                    ),
                    SizedBox(height: 8.0),
                    SellerScore(
                      text: 'Clients POV: ',
                      result: 'Good',
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                child: TSectionHeading(
                  title: "POV ABOUT THE PRODUCTS",
                  textColor: isDark ? TColors.white : TColors.kDarkGrey,
                ),
              ),
              ProductPovCard(productName: 'Iphone 13 promax', reviewDate: '12 jan, 2024', reviewTitle: 'was good', reviewText: 'the product was delivered fast and as mentioned in the description best seler', client: 'yacine', isVerified: true, rating: 4,),
              ProductPovCard(productName: 'Iphone 14 pro', reviewDate: '12 feb, 2024', reviewTitle: 'nice product', reviewText: 'the product was delivered fast and as mentioned in the description best seler', client: 'mohammed',isVerified: true, rating: 4.3),
              ProductPovCard(productName: 'hp elite book', reviewDate: '24 feb, 2024', reviewTitle: 'all good', reviewText: 'the product was delivered fast and as mentioned in the description best seler', client: 'karim',isVerified: true, rating: 4.5),
              ProductPovCard(productName: 'headphones', reviewDate: '13 june, 2024', reviewTitle: 'perfectly done', reviewText: 'the product was delivered fast and as mentioned in the description best seler', client: 'nour',isVerified: false, rating: 3.8),

            ],
          ),
        ),
      ),
    );
  }
}
