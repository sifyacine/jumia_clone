import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jumia_clone/features/products/controllers/product_controller.dart';
import 'package:jumia_clone/features/products/models/product.dart';

import '../../../../common/widgets/appbar/kappbar.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/simple_product_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../personalization/screens/history/last_seen_products/last_seen_products.dart';
import '../all_products/all_products.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Initialize the ProductController
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    List<String> imagePaths = [
      TImages.productImage1,
      TImages.productImage10,
      TImages.productImage11,
      TImages.productImage12,
      TImages.productImage23,
      TImages.productImage34,
      TImages.productImage45,
      TImages.productImage56,
    ];
    return Scaffold(
      backgroundColor: isDark ? TColors.dark : Colors.blue[50],
      appBar: const KAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text('order by phone at 0676774374'),
              ),
            ),

            /// body part
            Column(
              children: [
                /// promo slider
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  color: isDark ? Colors.black : Colors.white,
                  width: double.infinity,
                  child: const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.banner3,
                      TImages.banner2,
                      TImages.banner1,
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true, // Makes the GridView occupy only the space it needs
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      crossAxisSpacing: 10.0, // Horizontal spacing between items
                      mainAxisSpacing: 10.0, // Vertical spacing between items
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle item click, e.g., navigate to a new screen or show a dialog
                          print('Item $index clicked');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), // Circular border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3), // Shadow color and opacity
                                spreadRadius: 2, // Shadow spread radius
                                blurRadius: 4, // Shadow blur radius
                                offset: Offset(0, 2), // Shadow offset
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12), // Match border radius for clipping
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover, // Adjusts the image to fit within the container
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Column(children: [
                  Container(
                    color: isDark ? Colors.black : Colors.white,
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.defaultSpace),
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
                                    Text(
                                      "Flash Sales: quickly, limited stock",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Time left: ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          " 00h : 12min : 32 s",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View all",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      // Horizontal product cards
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: SizedBox(
                            height: 220,
                            // Adjust height as needed for your design
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products.length,
                                itemBuilder: (_, index) {
                                  final Product product =
                                      productController.products[index];
                                  return SizedBox(
                                    width: 160,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TSimpleProductCards(
                                        product: product,
                                      ),
                                    ),
                                  );
                                })),
                      )
                    ]),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Container(
                    color: isDark ? Colors.black : Colors.white,
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          color: const Color(0xFF800a00),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "MEGA FLASH SALES",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          )),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: SizedBox(
                            height: 220,
                            // Adjust height as needed for your design
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products.length,
                                itemBuilder: (_, index) {
                                  final Product product =
                                      productController.products[index];
                                  return SizedBox(
                                    width: 160,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TSimpleProductCards(
                                        product: product,
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    ]),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Container(
                    color: isDark ? Colors.black : Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.defaultSpace,
                              vertical: 8,
                            ),
                            color: const Color(0xFF800a00),
                            width: double.infinity,
                            child: const Center(
                              child: Text(
                                "OFFERS NOT TO BE MISSED",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            )),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          child: SizedBox(
                              height: 220,
                              // Adjust height as needed for your design
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productController.products.length,
                                  itemBuilder: (_, index) {
                                    final Product product =
                                        productController.products[index];
                                    return SizedBox(
                                      width: 160,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TSimpleProductCards(
                                          product: product,
                                        ),
                                      ),
                                    );
                                  })),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    color: isDark ? Colors.black : Colors.white,
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// section heading
                          TSectionHeading(
                            title: 'Recently seen',
                            onPressed: () {
                              Get.to(() => const LastSeenProductsScreen());
                            },
                            showActionButton: true,
                            buttonTextColor: TColors.primaryColor,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),

                          /// -- most requested
                          GridView.builder(
                              // Makes the GridView not scrollable
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                mainAxisSpacing: 10, // Spacing between rows
                                crossAxisSpacing: 10, // Spacing between columns
                                childAspectRatio: 0.8, // Width to height ratio
                              ),
                              itemCount: productController.products.length,
                              // Total number of cards
                              itemBuilder: (_, index) {
                                final Product product =
                                    productController.products[index];
                                return SizedBox(
                                  width: 160,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TSimpleProductCards(
                                      product: product,
                                    ),
                                  ),
                                );
                              })
                        ]),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    color: isDark ? Colors.black : Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Most requested',
                          onPressed: () {
                            Get.to(() => const AllProducts());
                          },
                          showActionButton: true,
                          buttonTextColor: TColors.primaryColor,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// -- most requested
                        GridView.builder(
                            // Makes the GridView not scrollable
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              mainAxisSpacing: 10, // Spacing between rows
                              crossAxisSpacing: 10, // Spacing between columns
                              childAspectRatio: 0.8, // Width to height ratio
                            ),
                            itemCount: productController.products.length,
                            // Total number of cards
                            itemBuilder: (_, index) {
                              final Product product =
                                  productController.products[index];
                              return SizedBox(
                                width: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TSimpleProductCards(
                                    product: product,
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
