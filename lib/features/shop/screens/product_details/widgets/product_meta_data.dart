import 'package:flutter/material.dart';
import 'package:jumia_clone/features/products/models/product.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../common/widgets/texts/brandicon_verify_button.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/produt_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        TProductTitleText(
          title: product.name,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs,
                horizontal: TSizes.sm,
              ),
              child: Text(
                '${product.discount.toInt()}%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.kBlack),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price
            Text(
              "${product.price.toInt()} DA",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Discounted Price
            TProductPricwText(
                price:
                    '${(product.price - (product.price * (product.discount / 100))).toInt()} DA'),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock Status
        _buildStatusRow(context),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand Info
        _buildBrandRow(isDark),
      ],
    );
  }

  Widget _buildStatusRow(BuildContext context) {
    return const Row(
      children: [
        TProductTitleText(
          title: 'Status: ',
          textAlign: TextAlign.start,
        ),
        Text(
          ' In Stock',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBrandRow(bool isDark) {
    return Row(
      children: [
        TCircularImage(
          image: TImages.applePay,
          width: 32,
          height: 32,
          backgroundColor: isDark ? TColors.kGrey : TColors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TBrandTitleWithVerifiedIcon(
          title: product.category,
          brandTextSize: TextSizes.medium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
