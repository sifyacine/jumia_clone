import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../all_products/all_products.dart';

class SectionConfig {
  final String title;
  final int numberOfPictures;

  SectionConfig({
    required this.title,
    required this.numberOfPictures,
  });
}

class TCategoryTab extends StatelessWidget {
  final List<SectionConfig> sections;

  const TCategoryTab({
  super.key,
  required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final backgroundColor = isDark ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // My Orders Tile
          Container(
            width: double.infinity,
            color: backgroundColor,
            child: TSettingsMenuTile(
              title: 'See all products',
              onTab: () {
                Get.to(() => const AllProducts());
              },
              trailing: const Icon(Iconsax.arrow),
            ),
          ),
          const SizedBox(height: 8.0), // Add spacing before sections

          // Dynamic Sections
          for (var section in sections)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Space between sections
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: double.infinity,
                color: backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                      buttonTextColor: TColors.primaryColor,
                      title: section.title,
                      showActionButton: true,
                    ),
                    Divider(color: isDark ? Colors.grey[600] : Colors.grey[200]),
                    // Grid layout to show all images
                    GridView.builder(
                      shrinkWrap: true, // Prevent scrolling within this GridView
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: section.numberOfPictures,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey[300], // Placeholder color for images
                          child: Center(
                            child: Text(
                              'Image ${index + 1}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
