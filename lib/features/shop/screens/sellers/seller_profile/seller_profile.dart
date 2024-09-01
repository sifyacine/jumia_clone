import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
              product_pov_card(),
              product_pov_card(),
              product_pov_card(),
              product_pov_card(),
              product_pov_card(),
            ],
          ),
        ),
      ),
    );
  }
}

class product_pov_card extends StatelessWidget {
  const product_pov_card({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: (){
        Get.to(() => const ProductDetails());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18.0, vertical: 12.0),
              color: isDark ? TColors.kBlack : TColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("IPhone 15 pro max"),
                          Row(
                            children: [
                              TRatingBarIndicator(rating: 4),
                              Text(
                                '02 jan, 2024',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const ReadMoreText(
                    "Good",
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                    lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 8.0),
                  const ReadMoreText(
                    "the product is very good and the delivery was fast the product is very good and the delivery was fast the product is very good and the delivery was fast ",
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                    lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "by yacine",
                        style: TextStyle(
                            fontSize: 12.0, color: TColors.kDarkGrey),
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.check,
                              size: 14.0, color: Colors.green),
                          SizedBox(width: 8.0),
                          Text(
                            "verified",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
