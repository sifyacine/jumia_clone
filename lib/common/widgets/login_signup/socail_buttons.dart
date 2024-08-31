import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.kGrey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
<<<<<<< HEAD
            onPressed: () {} /*controller.signInWithGoogle()*/,
=======
            onPressed: () => controller.googleSignIn(),
>>>>>>> d7ef2d57314895c948f7ba0ae3a99832f67943c2
            icon: const Image(
              width: TSizes.icond,
              height: TSizes.icond,
              image: AssetImage(
                TImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.kGrey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.icond,
              height: TSizes.icond,
              image: AssetImage(
                TImages.facebook,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
