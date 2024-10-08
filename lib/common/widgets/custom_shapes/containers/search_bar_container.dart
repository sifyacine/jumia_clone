import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
  super.key,
  required this.text,
  this.icon,
  this.showBackground = true,
  this.showBorder = true,
  this.onTap,
  this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          // Adjust the width to fit within the app bar
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                ? TColors.dark
                : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: showBorder ? Border.all(color: TColors.kGrey) : null,
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_normal,
                color: TColors.kDarkGrey,
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
