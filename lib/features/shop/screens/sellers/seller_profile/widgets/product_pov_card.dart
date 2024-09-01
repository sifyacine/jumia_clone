import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:readmore/readmore.dart';

import '../../../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../product_details/product_details.dart';

class ProductPovCard extends StatelessWidget {
  const ProductPovCard({
  super.key, required this.productName, required this.reviewDate, required this.reviewTitle, required this.reviewText, required this.client, this.isVerified = false, required this.rating,
  });
  final String productName;
  final String reviewDate;
  final String reviewTitle;
  final String reviewText;
  final String client;
  final bool isVerified;
  final double rating;

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName),
                          Row(
                            children: [
                              TRatingBarIndicator(rating: rating),
                              SizedBox(width: 4.0),
                              Text(
                                reviewDate,
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  ReadMoreText(
                    reviewTitle,
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                    lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 8.0),
                  ReadMoreText(
                    reviewText,
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                    lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "by $client",
                        style: TextStyle(
                            fontSize: 12.0, color: TColors.kDarkGrey),
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.check,
                              size: 14.0, color: isVerified? Colors.green: Colors.red),
                          SizedBox(width: 8.0),
                          Text(
                            isVerified?
                            "verified" : "not verified",
                            style: TextStyle(
                                fontSize: 12.0, color: isVerified? Colors.green: Colors.red),
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
