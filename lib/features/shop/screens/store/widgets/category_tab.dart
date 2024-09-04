import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jumia_clone/features/products/controllers/product_controller.dart';

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

class TCategoryTab extends StatefulWidget {
  final List<SectionConfig> sections;

  TCategoryTab({
    super.key,
    required this.sections,
  });

  @override
  State<TCategoryTab> createState() => _TCategoryTabState();
}

class _TCategoryTabState extends State<TCategoryTab> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    // Wait until products are fetched and then filter
    productController.fetchAllProducts().then((_) {
      widget.sections.forEach((section) {
        print("Filtering for section: ${section.title}"); // Debugging statement
        productController.filterProductsByCategory(section.title);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final backgroundColor = isDark ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      child: ListView(
        children: [
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
          const SizedBox(height: 8.0),

          // Dynamic Sections
          ...widget.sections.map((section) {
            return Obx(() {
              final filteredProducts =
                  productController.filteredProductsByCategory[section.title] ??
                      [];

              print(
                  "Displaying products for section: ${section.title}, Count: ${filteredProducts.length}"); // Debugging statement

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
                      Divider(
                        color: isDark ? Colors.grey[600] : Colors.grey[200],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              image: product.images.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(product.images[0]),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: product.images.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No Image',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              );
            });
          }).toList(),
        ],
      ),
    );
  }
}
