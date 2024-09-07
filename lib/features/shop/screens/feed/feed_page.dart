import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jumia_clone/features/shop/screens/feed/widgets/exploring_tab.dart';
import 'package:jumia_clone/features/shop/screens/feed/widgets/following_tab.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/restricted_page_placeholder/restricted_page_placeholder.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationRepository>();
    final userEmail = authController.auth.currentUser?.email;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // Removes the leading back arrow
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
            userEmail != null
                ? const FollowingTab()
                : const RestrictedPagePlaceholder(
                    title: 'You are not signed in',
                    subtitle:
                        'Your should sign in to see the content of this page',
                    imageUrl: '',
                  ), // Replace with your content for Following tab
            ExploringTab(), // Replace with your content for Exploring tab
          ],
        ),
      ),
    );
  }
}
