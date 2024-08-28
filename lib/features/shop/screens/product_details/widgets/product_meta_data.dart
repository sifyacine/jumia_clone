import 'package:flutter/material.dart';

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
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        const TProductTitleText(
          title: 'Orange nike air jordan 4',
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
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.kBlack),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price
            Text(
              '\$300',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Discounted Price
            const TProductPricwText(price: '225'),
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
    return Row(
      children: [
        const TProductTitleText(
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
          image: TImages.nikeIcon,
          width: 32,
          height: 32,
          backgroundColor: isDark ? TColors.kGrey : TColors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        const TBrandTitleWithVerifiedIcon(
          title: "Nike",
          brandTextSize: TextSizes.medium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
