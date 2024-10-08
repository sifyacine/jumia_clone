import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jumia_clone/features/products/models/product.dart';
import 'package:jumia_clone/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:jumia_clone/features/shop/screens/product_details/widgets/location_selection.dart';
import 'package:jumia_clone/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:jumia_clone/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:jumia_clone/features/shop/screens/product_details/widgets/products_attributes.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : Colors.grey[200],
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product image slider
            TProductImageSlider(
              images: product.images,
              cover: product.cover,
            ),

            /// Product details
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  color: isDark ? Colors.black : Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      /// Price, title, stock, and brand
                      TProductMetaData(
                        product: product,
                      ),

                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// Attributes
                      const TProductAttributes(),
                    ],
                  ),
                ),

                const SizedBox(height: 8.0),

                /// Location Selection for Delivery and Return Information
                const LocationSelection(),

                const SizedBox(height: TSizes.spaceBtwSections),

                Container(
                  width: double.infinity,
                  color: isDark ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  child: Column(
                    children: [
                      /// Description
                      const TSectionHeading(title: 'Description'),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      ReadMoreText(
                        product.description,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Show more',
                        trimExpandedText: ' less',
                        moreStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                        lessStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),

                /// Reviews
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  width: double.infinity,
                  color: isDark ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: "Reviews (199)"),
                      IconButton(
                        onPressed: () {
                          Get.to(() => const ProductReviewsScreen());
                        },
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    color: isDark ? Colors.black : Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("any questions concerning the product?"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Iconsax.messages, color: TColors.primaryColor),
                            SizedBox(width: 6.0),
                            Text(
                              "contact us",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: TColors.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
