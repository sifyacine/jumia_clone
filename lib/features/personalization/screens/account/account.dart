import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/restricted_page_placeholder/restricted_page_placeholder.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

import '../../../authentication/screens/login/login_screen.dart';
import '../../../shop/screens/order/order.dart';
import '../../../shop/screens/wishlist/wishlist.dart';
import '../address/addresses.dart';
import '../coupons/coupons.dart';
import '../history/inbox/inbox_page.dart';
import '../history/last_search/search_history.dart';
import '../history/last_seen_products/last_seen_products.dart';
import '../history/reviews_ratings/reviews_history.dart';
import '../profile/profile.dart';
import '../sellers/sellers.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final titleColor = isDark ? Colors.white : Colors.black;
    final authController = Get.find<AuthenticationRepository>();
    final userEmail = authController.auth.currentUser?.email;

    return Scaffold(
      appBar: TAppBar(
        title: const Text("Account", style: TextStyle(color: TColors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: titleColor),
          ),
          TCartCounterIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: isDark ? TColors.dark : TColors.light,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userEmail != null
                  ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    height: 80,
                    width: double.infinity,
                    color: TColors.dark,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome Back",
                            style: TextStyle(
                                color: TColors.primaryColor,
                                fontSize: 16)),
                        Text(userEmail,
                            style: const TextStyle(
                                color: TColors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              )
                  : Container(
                padding: const EdgeInsets.all(18),
                height: 80,
                width: double.infinity,
                color: TColors.dark,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Please log in",
                        style: TextStyle(
                            color: TColors.white, fontSize: 12)),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: const Text("Sign In",
                          style: TextStyle(color: TColors.primaryColor)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    const TSectionHeading(
                        title: 'My HTA Account', textColor: Colors.grey),
                    const SizedBox(height: 8.0),
                    _buildSectionContainer(
                      children: [
                        TSettingsMenuTile(
                          icon: Iconsax.bag_tick,
                          title: 'My orders',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const OrderScreen()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.messages,
                          title: 'Messages',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const InboxPage()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.messages,
                          title: 'Ratings and reviews',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const RatingPage()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.discount_shape,
                          title: 'My coupons',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const CouponsPage()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.heart,
                          title: 'My wishlist',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const WishlistPage()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.shop,
                          title: 'Sellers',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const SellersList()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Iconsax.eye,
                          title: 'Last seen products',
                          onTab: () {
                            Get.to(() => const LastSeenProductsScreen());
                          },
                        ),
                        TSettingsMenuTile(
                          icon: Icons.search,
                          title: 'Recent search',
                          onTab: () {
                            Get.to(() => const SearchHistory());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    const TSectionHeading(
                        title: 'My Settings', textColor: Colors.grey),
                    const SizedBox(height: 8.0),
                    _buildSectionContainer(
                      children: [
                        TSettingsMenuTile(
                          title: 'My addresses',
                          onTab: () {
                            Get.to(() => userEmail != null
                                ? const AddressesScreen()
                                : RestrictedPagePlaceholder(
                              title: 'You re not signed in',
                              subtitle: 'you should sign in to see the content of this page',
                              imageUrl: '',));
                          },
                        ),
                        if (userEmail != null) ...[
                          TSettingsMenuTile(
                            title: 'Account settings',
                            onTab: () {
                              Get.to(() => const ProfileScreen());
                            },
                          ),
                          TSettingsMenuTile(
                            title: 'Delete account',
                            onTab: () {
                              Get.to(() => Container());
                            },
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              if (userEmail != null) ...[
                TextButton(
                  onPressed: () {
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Logout"),
                          content:
                          const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancel",
                                  style: TextStyle(color: Colors.grey)),
                              onPressed: () {
                                // Close the dialog without logging out
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Logout",
                                  style:
                                  TextStyle(color: TColors.primaryColor)),
                              onPressed: () {
                                // Call the logout method from your controller
                                authController.logout();
                                // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Log out",
                    style:
                    TextStyle(fontSize: 18.0, color: TColors.primaryColor),
                  ),
                ),
              ] else
                TextButton(
                  onPressed: () {
                    Get.offAll(() => const LoginScreen());
                  },
                  child: const Text(
                    "sign in",
                    style:
                    TextStyle(fontSize: 18.0, color: TColors.primaryColor),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    final isDark = THelperFunctions.isDarkMode(Get.context!);

    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Column(
        children: children,
      ),
    );
  }
}
