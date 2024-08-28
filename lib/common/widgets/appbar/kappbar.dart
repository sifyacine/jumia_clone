import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../custom_shapes/containers/search_bar_container.dart';
import '../products/cart/cart_menu_icon.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    Key? key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.color = TColors.dark,
  }) : super(key: key);

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Iconsax.arrow_left))
          : leadingIcon != null
          ? IconButton(
          onPressed: () {
            leadingOnPressed;
          },
          icon: Icon(leadingIcon))
          : null,
      // Use the adjusted TSearchContainer here
      title: const TSearchContainer(text: 'Search about...'),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
