import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jumia_clone/utils/constants/colors.dart';
import 'package:jumia_clone/utils/helpers/helper_functions.dart';

import 'features/personalization/screens/account/account.dart';
import 'features/personalization/screens/help/help_screen.dart';
import 'features/shop/screens/feed/feed_page.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 74,
          backgroundColor: isDark ? TColors.dark : TColors.light,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.shop), label: 'Categories'),
            NavigationDestination(icon: Icon(Iconsax.chart), label: 'Feed'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Account'),
            NavigationDestination(
                icon: Icon(Icons.help_outlined), label: 'help'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    const StorePage(),
    const FeedPage(),
    const AccountScreen(),
    const HelpScreen(),
  ];
}
