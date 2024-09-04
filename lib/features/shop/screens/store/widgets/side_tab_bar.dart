import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumia_clone/features/products/controllers/category_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'category_tab.dart';

class SideTabBar extends StatefulWidget {
  const SideTabBar({super.key});

  @override
  State<SideTabBar> createState() => _SideTabBarState();
}

class _SideTabBarState extends State<SideTabBar> {
  final CategoryController categoryController = Get.put(CategoryController());
  final SideTabBarController sideTabBarController =
      Get.put(SideTabBarController());

  @override
  void initState() {
    super.initState();
    // Fetch categories when the widget is initialized
    categoryController.fetchCategories();
  }

  Future<void> _refreshCategories() async {
    // Refresh the categories
    await categoryController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    // Get the dark mode
    final isDark = THelperFunctions.isDarkMode(context);
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      // Fetch category names from the controller
      final categories = categoryController.categoryNames;

      return RefreshIndicator(
        onRefresh: _refreshCategories,
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.25,
              color: isDark ? TColors.dark : TColors.light,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      sideTabBarController
                          .changeIndex(index); // Update selected index
                    },
                    child: Obx(() => Container(
                          color:
                              sideTabBarController.selectedIndex.value == index
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
                                  color: sideTabBarController
                                              .selectedIndex.value ==
                                          index
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
                                      color: sideTabBarController
                                                  .selectedIndex.value ==
                                              index
                                          ? TColors.primaryColor
                                          : (isDark
                                              ? TColors.white
                                              : TColors.kBlack),
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
                      index: sideTabBarController.selectedIndex.value,
                      children: categories.map((category) {
                        return TCategoryTab(
                          sections: getSectionsForCategory(category),
                        );
                      }).toList(),
                    ),
                  )),
            ),
          ],
        ),
      );
    });
  }

  // Define function to fetch section data based on the category
  List<SectionConfig> getSectionsForCategory(String category) {
    final subCategories =
        categoryController.getSubCategoriesForCategory(category);
    return subCategories
        .map((subCategory) => SectionConfig(
              title: subCategory,
              numberOfPictures: 4,
            ))
        .toList();
  }
}

class SideTabBarController extends GetxController {
  var selectedIndex = 0.obs; // Observed variable for selected index

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
