import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CustomSellerCard extends StatelessWidget {
  final String labelText;
  final String mainText;
  final List<String> imageUrls;
  final String footerText;
  final String time;
  final void Function() onTap;

  const CustomSellerCard({
    Key? key,
    required this.labelText,
    required this.mainText,
    required this.imageUrls,
    required this.footerText,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: (){},
      child: Card(
        color: isDark ? TColors.kBlack : TColors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First item: Container with text, blue or red
              Container(
                padding: const EdgeInsets.all(2),
                color: Colors.blue,
                child: Text(
                  labelText,
                  style: const TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
              const SizedBox(height: 8),

              // Second item: Row with icon and main text, plus a button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.home),
                      const SizedBox(width: 6.0),
                      Text(
                        mainText,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Improved Follow Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: TColors.primaryColor, // Background color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4.0), // Padding

                      side: BorderSide(
                        color: TColors.primaryColor, // Border color
                      ),
                    ),
                    child: const Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Third item: Row of three images without spacing
              Row(
                mainAxisSize: MainAxisSize.min, // Make the row fit its children
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
                                image: AssetImage(imageUrls[i]), // If using network images, switch to NetworkImage
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (i == 2 && imageUrls.length > 3) // Overlay on the last image if there are more than 3
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
              const SizedBox(height: 8.0),

              // Fourth item: Footer text
              Text(
                footerText,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8.0),

              // Fifth item: Footer row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time+" Ago",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                    Row(
                      children: [
                        Icon(Iconsax.share, color: TColors.primaryColor, size: 18.0),
                        const SizedBox(width: 4),
                        Text(
                          "Share",
                          style: const TextStyle(fontSize: 12, color: TColors.primaryColor),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
