import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class TGridLayout extends StatelessWidget {
  const TGridLayout({
  super.key, required this.itemCount, this.mainAxisExtent = 288, required this.itemBuilder, required this.crossAxisCount,
  });

  final int itemCount;
  final int crossAxisCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext context, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,

      ),
      itemBuilder: itemBuilder,
    );
  }
}
