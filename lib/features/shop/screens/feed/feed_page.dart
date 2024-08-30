import 'package:flutter/material.dart';

import 'package:jumia_clone/features/shop/screens/feed/widgets/exploring_tab.dart';
import 'package:jumia_clone/features/shop/screens/feed/widgets/following_tab.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false, // Removes the leading back arrow
          backgroundColor: TColors.dark,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            TCartCounterIcon(
              onPressed: () {},
            ),
          ],
          title: const Text('Feed', style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            unselectedLabelColor: TColors.white,
            labelColor: TColors.primaryColor,
            indicatorColor: TColors.primaryColor,
            tabs: [
              Tab(text: 'Following'),
              Tab(text: 'Exploring'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowingTab(), // Replace with your content for Following tab
            ExploringTab(), // Replace with your content for Exploring tab
          ],
        ),
      ),
    );
  }
}
