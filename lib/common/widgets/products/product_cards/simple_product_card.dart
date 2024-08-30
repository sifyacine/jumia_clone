import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_title_text.dart';
import '../../texts/produt_price_text.dart';

class TSimpleProductCards extends StatelessWidget {
  const TSimpleProductCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
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
                  // Replace TRoundedImage with Image.asset or Image.network
                  ClipRRect(
                    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
                    child: Image.asset(
                      TImages.productImage19,
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
                        '-25%',
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
            SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: 'Blue Nike Air Jordan 4 Shoe',
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TProductPricwText(price: '630',)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
