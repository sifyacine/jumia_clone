import 'package:flutter/material.dart';
import 'package:jumia_clone/features/shop/screens/store/widgets/side_tab_bar.dart';

import '../../../../common/widgets/appbar/kappbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the app is in dark mode
    final isDark = THelperFunctions.isDarkMode(context);
    final backgroundColor = isDark ? TColors.dark : TColors.light;

    // Initialize the controller (if needed, otherwise it will be initialized in SideTabBar)

    return Scaffold(
      appBar: KAppBar(),
      body: SideTabBar(), // Including the SideTabBar widget
    );
  }
}
