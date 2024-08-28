import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icon/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatefulWidget {
  const TBottomAddToCart({super.key});

  @override
  _TBottomAddToCartState createState() => _TBottomAddToCartState();
}

class _TBottomAddToCartState extends State<TBottomAddToCart> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isDark ? TColors.kDarkGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(TSizes.cardRadiuslg),
          topLeft: Radius.circular(TSizes.cardRadiuslg),
        ),
      ),
      child: Row(
        children: [
          // First button - Home icon
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                // Your action for home button
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: TColors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Icon(Iconsax.home, color: TColors.primaryColor),
            ),
          ),
          const SizedBox(width: 8.0),

          // Second button - Phone icon
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                // Your action for phone button
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: TColors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Icon(Iconsax.call, color: TColors.primaryColor),
            ),
          ),
          const SizedBox(width: 8.0),

          // Expanded button - Buy/Cart actions
          Expanded(
            flex: 4,
            child: _itemCount > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Minus button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_itemCount > 0) {
                              _itemCount--;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(TSizes.md),
                          backgroundColor: Colors.orange, // Use orange color
                          side: const BorderSide(color: Colors.orange),
                        ),
                        child: const Icon(Iconsax.minus, color: Colors.white),
                      ),
                      // Counter
                      Text(
                        '$_itemCount',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: TColors.kBlack),
                      ),
                      // Plus button
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _itemCount++;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: TColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: const Icon(Iconsax.add, color: TColors.primaryColor),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_itemCount == 0) {
                          _itemCount = 1;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: Colors.orange, // Use orange color
                      side: const BorderSide(color: Colors.orange),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        SizedBox(width: TSizes.spaceBtwItems),
                        Text(
                          'Buy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
