
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icon/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? TColors.kDarkGrey : TColors.light,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(TSizes.cardRadiuslg), topLeft: Radius.circular(TSizes.cardRadiuslg))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(icon: Iconsax.minus, backgroundColor: TColors.kDarkGrey, width: 40, height: 40, color: TColors.white,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('2', style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              const TCircularIcon(icon: Iconsax.add, backgroundColor: TColors.kBlack, width: 40, height: 40, color: TColors.white,),
            ],
          ),
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(TSizes.md), backgroundColor: TColors.kBlack, side: const BorderSide(color: TColors.kBlack)) ,child: const Text('Add to cart')),
        ],
      ),
    );
  }
}
