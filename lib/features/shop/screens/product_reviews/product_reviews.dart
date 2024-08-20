
import 'package:flutter/material.dart';
import 'package:jumia_clone/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: const TAppBar(title: Text('Reviews and ratings'), showBackArrow: true,),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(height: TSizes.spaceBtwItems,),


              /// overall product rating
              const TOverallProductRating(),

              const TRatingBarIndicator(rating: 3.5,),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// user reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),


    );
  }
}
