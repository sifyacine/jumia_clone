import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'category_tab.dart';

class SideTabBar extends StatelessWidget {
  SideTabBar({Key? key}) : super(key: key);

  final SideTabBarController controller = Get.put(SideTabBarController());

  final List<String> categories = [
    'PC',
    'Phones',
    'AirPods',
    'Headphone',
    'Laptops',
    'Tablets',
    'Monitors',
    'Cameras',
    'Keyboards',
    'Mice',
    'Speakers',
    'Chargers',
  ];

  // Define function to fetch section data based on the category
  List<SectionConfig> getSectionsForCategory(String category) {
    switch (category) {
      case 'PC':
        return [
          SectionConfig(title: 'Gaming PCs', numberOfPictures: 6),
          SectionConfig(title: 'Office PCs', numberOfPictures: 4),
        ];
      case 'Phones':
        return [
          SectionConfig(title: 'Smartphones', numberOfPictures: 8),
          SectionConfig(title: 'Feature Phones', numberOfPictures: 3),
        ];
      case 'AirPods':
        return [
          SectionConfig(title: 'AirPods Pro', numberOfPictures: 4),
          SectionConfig(title: 'AirPods Max', numberOfPictures: 2),
        ];
      case 'Headphone':
        return [
          SectionConfig(title: 'Wireless Headphones', numberOfPictures: 5),
          SectionConfig(title: 'Noise Cancelling', numberOfPictures: 4),
        ];
    // Add similar cases for other categories
      default:
        return [
          SectionConfig(title: 'Miscellaneous', numberOfPictures: 3),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the dark mode
    final isDark = THelperFunctions.isDarkMode(context);
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.25,
          color: isDark ? TColors.dark : TColors.light,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.changeIndex(index); // Update selected index
                },
                child: Obx(() => Container(
                  color: controller.selectedIndex.value == index
                      ? (isDark ? TColors.dark : TColors.light)
                      : (isDark ? TColors.kBlack : TColors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 60,
                          width: 5,
                          color: controller.selectedIndex.value == index
                              ? TColors.primaryColor
                              : Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10, // Set font size to 10
                              color: controller.selectedIndex.value == index
                                  ? TColors.primaryColor
                                  : (isDark ? TColors.white : TColors.kBlack),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              );
            },
          ),
        ),
        Expanded(
          child: Obx(() => Container(
            color: isDark ? TColors.dark : TColors.light,
            child: IndexedStack(
              index: controller.selectedIndex.value,
              children: categories.map((category) {
                return TCategoryTab(
                  sections: getSectionsForCategory(category),
                );
              }).toList(),
            ),
          )),
        ),
      ],
    );
  }
}

class SideTabBarController extends GetxController {
  var selectedIndex = 0.obs; // Observed variable for selected index

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
