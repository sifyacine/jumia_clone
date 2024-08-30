import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/loaders/loaders.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Signup method
  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.doceranimation,
      );

      // Check the internet connection asynchronously
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Validate the signup form
      if (!signupFormKey.currentState!.validate()) return;
      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create an account, you must have to read and accept privacy policy and terms of use");
        return;
      }
      // register
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // save user data in fire store
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // show success message
      TLoaders.successSnackBar(title: "Congratulations", message: "your account has been created! verify email to continue");
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TLoaders.errorSnackBar(
        title: "Oh snap!",
        message: e.toString(),
      );
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
