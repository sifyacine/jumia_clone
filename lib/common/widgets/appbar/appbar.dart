
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../products/cart/cart_menu_icon.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    Key? key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed, this.color=TColors.dark,
  }) : super(key: key);

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final  Color? color;

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
              icon: const Icon(Iconsax.arrow_left, color: Colors.white))
          : leadingIcon != null ? IconButton(
              onPressed: () {
                leadingOnPressed;
              },
              icon: Icon(leadingIcon)) : null,
      title: title,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.white),
        ),
        TCartCounterIcon(
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // Todo: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
