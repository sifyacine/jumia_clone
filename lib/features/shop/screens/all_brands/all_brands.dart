
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// heading
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// brands
              TGridLayout(itemCount: 6, mainAxisExtent: 80,itemBuilder: (context, index) => TBrandCard(showBorder: true, onTab: (){Get.to(() => const BrandProducts());},), crossAxisCount: 3,),

            ],
          ),
        ),
      ),
    );
  }
}
