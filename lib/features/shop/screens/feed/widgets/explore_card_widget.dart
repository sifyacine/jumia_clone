import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CustomCard extends StatelessWidget {
  final String labelText;
  final String mainText;
  final List<String> imageUrls;
  final String footerText;
  final IconData? optionalIcon;
  final String? optionalText;
  final bool isBlueContainer;
  final void Function()? onTap;

  const CustomCard({
    Key? key,
    required this.labelText,
    required this.mainText,
    required this.imageUrls,
    required this.footerText,
    this.optionalIcon,
    this.optionalText,
    this.isBlueContainer = true, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Card(
      color: isDark? TColors.kBlack : TColors.white,

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First item: Container with text, blue or red
            Container(
              padding: const EdgeInsets.all(2),
              color: isBlueContainer ? Colors.blue : Colors.red,
              child: Text(
                labelText,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),

            const SizedBox(height: 8),

            // Second item: Main text
            Text(
              mainText,
              style: const TextStyle(fontSize: 14,),
            ),

            const SizedBox(height: 16),

            // Third item: Row of three images without spacing
            Row(
              mainAxisSize: MainAxisSize.min,  // Make the row fit its children
              children: [
                // Display only up to 3 images
                for (int i = 0; i < (imageUrls.length > 3 ? 3 : imageUrls.length); i++)
                  GestureDetector(
                    onTap: onTap,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: AssetImage(imageUrls[i]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (i == 2) // Overlay on the last image if there are more than 3
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(2.0),
                            alignment: Alignment.center,
                            color: Colors.grey.withOpacity(0.6),
                            child: const Text(
                              'View All',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Fourth item: Footer row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  footerText,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                if (optionalIcon != null && optionalText != null)
                  Row(
                    children: [
                      Icon(optionalIcon, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        optionalText!,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
