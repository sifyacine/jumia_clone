
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/kappbar.dart';

import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_cards_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../all_products/all_products.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark? TColors.dark: Colors.blue[50],
      appBar: const KAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical:4.0),
              child: Center(
                child: Text('order by phone at 0676774374'),
              ),
            ),
            /// body part
            Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// promo slider
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    color: isDark? Colors.black : Colors.white,
                    width: double.infinity,
                    child: const TPromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3,
                        TImages.promoBanner3,
                        TImages.promoBanner2,
                        TImages.promoBanner1,
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Column(
                    children: [
                      Container(
                                                color: isDark? Colors.black : Colors.white,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                              color: Colors.red,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Iconsax.flash, color: Colors.yellow),
                                      SizedBox(width: 6.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Flash Sales: quickly, limited stock", style:TextStyle(color: Colors.white, fontSize: 12),),
                                          Row(
                                            children: [
                                              Text("Time left: ", style:TextStyle(color: Colors.white, fontSize: 12),),
                                              Text(" 00h : 12min : 32 s",style:TextStyle(color: Colors.white, fontSize: 12),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextButton(onPressed: () {  }, child: const Text("View all", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            // Horizontal product cards
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),                              child: SizedBox(
                                height: 220, // Adjust height as needed for your design
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (_, index) => const SizedBox(
                                    width: 160, // Adjust width for each card
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TProductCardsVertical(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),

                      const SizedBox(height: TSizes.spaceBtwItems),

                      Container(

                        color: isDark? Colors.black : Colors.white,
                        width: double.infinity,
                        child:Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                                color: const Color(0xFF800a00),
                                width: double.infinity,
                                child: const Center(
                                  child: Text("MEGA FLASH SALES", style: TextStyle(color: Colors.white, fontSize: 12.0),),
                                )
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                              child: SizedBox(
                                height: 220, // Adjust height as needed for your design
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (_, index) => const SizedBox(
                                    width: 160, // Adjust width for each card
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TProductCardsVertical(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Container(

                        color: isDark? Colors.black : Colors.white,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: 8,),
                                color: const Color(0xFF800a00),
                                width: double.infinity,
                                child: const Center(
                                  child: Text("OFFERS NOT TO BE MISSED", style: TextStyle(color: Colors.white, fontSize: 12.0),),
                                )
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),                              child: SizedBox(
                                height: 220, // Adjust height as needed for your design
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (_, index) => const SizedBox(
                                    width: 160, // Adjust width for each card
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TProductCardsVertical(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        color: isDark? Colors.black : Colors.white,
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// section heading
                              TSectionHeading(
                                title: 'Recently seen',
                                onPressed: () {Get.to(() => const AllProducts());},
                                showActionButton: true,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),

                              /// -- most requested
                              TGridLayout(
                                itemCount: 4,
                                itemBuilder: (_, index) => const TProductCardsVertical(),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      const SizedBox(height: TSizes.spaceBtwItems),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        color: isDark? Colors.black : Colors.white,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// section heading
                                  TSectionHeading(
                                    title: 'Most requested',
                                    onPressed: () {Get.to(() => const AllProducts());},
                                    showActionButton: true,
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),

                                  /// -- most requested
                                  TGridLayout(
                                    itemCount: 4,
                                    itemBuilder: (_, index) => const TProductCardsVertical(),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
