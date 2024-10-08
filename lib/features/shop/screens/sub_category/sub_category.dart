
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../common/widgets/products/product_cards/product_cards_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// sub categories
              Column(
                children: [
                  /// heading
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                    showActionButton: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SizedBox(
                    height: 130,

                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) =>
                            const TProductCardsHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
