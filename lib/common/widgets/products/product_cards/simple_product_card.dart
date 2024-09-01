import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumia_clone/features/products/models/product.dart';

import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_title_text.dart';
import '../../texts/produt_price_text.dart';

class TSimpleProductCards extends StatelessWidget {
  final Product product; // Add a Product instance

  const TSimpleProductCards({
    Key? key,
    required this.product, // Make sure it's required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(
          product: product)), // Pass the product to the ProductDetails screen
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.dark : TColors.light,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 100,
              width: double.infinity,
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(TSizes.productImageRadius),
                    child: Image.network(
                      // Updated to use network image
                      product.images.isNotEmpty
                          ? product.images[0]
                          : TImages
                              .productImage19, // Use the first image if available
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: Colors.orange[100]!,
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.xs, horizontal: TSizes.sm),
                      child: Text(
                        '-${product.discount}%', // Use the product's discount
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.name,
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TProductPricwText(
                    price:
                        '${product.price - (product.price * (product.discount / 100))}',
                  ) // Calculate and display discounted price
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
