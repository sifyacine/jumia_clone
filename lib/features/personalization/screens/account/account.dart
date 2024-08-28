import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
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

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final titleColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: TAppBar(
        title: const Text("Account"),
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
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    height: 80,
                    width: double.infinity,
                    color: TColors.dark,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back", style: TextStyle(color: TColors.primaryColor, fontSize: 16),),
                        Text("ycn585@gmail.com", style: TextStyle(color: TColors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    const TSectionHeading(title: 'My HTA Account', textColor: Colors.grey),
                    const SizedBox(height: 8.0),

                    _buildSectionContainer(
                      children: [
                        TSettingsMenuTile(icon: Iconsax.bag_tick,title: 'My orders', onTab: (){ Get.to(() => const OrderScreen());},),
                        TSettingsMenuTile(icon: Iconsax.messages,title: 'Messages', onTab: (){ Get.to(() => const InboxPage());},),
                        TSettingsMenuTile(icon: Iconsax.messages,title: 'Ratings  and reviews', onTab: (){ Get.to(() => const RatingPage());},),
                        TSettingsMenuTile(icon: Iconsax.discount_shape ,title: 'My coupons', onTab: (){Get.to(() => const CouponsPage());},),
                        TSettingsMenuTile(icon: Iconsax.heart,title: 'My wishlist', onTab: (){ Get.to(() => const WishlistPage());},),
                        TSettingsMenuTile(icon: Iconsax.shop,title: 'Sellers', onTab: (){ Get.to(() => const SellersList());},),
                        TSettingsMenuTile(icon: Iconsax.eye,title: 'Last seen products', onTab: (){ Get.to(() => const LastSeenProductsScreen());},),
                        TSettingsMenuTile(icon: Icons.search,title: 'Recent search', onTab: (){ Get.to(() => const SearchHistory());},),

                      ],
                    ),

                    const SizedBox(height: 12.0),
                    const TSectionHeading(title: 'My Settings', textColor: Colors.grey),
                    const SizedBox(height: 8.0),
                    _buildSectionContainer(
                      children: [
                        TSettingsMenuTile(title: 'My addresses', onTab: (){ Get.to(() => const AddressesScreen());},),
                        TSettingsMenuTile(title: 'account settings', onTab: (){ Get.to(() => const ProfileScreen());},),
                        TSettingsMenuTile(title: 'Delete account', onTab: (){ Get.to(() => Container());},),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: (){},
                child: Text("log out", style: TextStyle(fontSize: 18.0, color: TColors.primaryColor)),
              ),
            ],

          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Column(
        children: children,
      ),
    );
  }

}
