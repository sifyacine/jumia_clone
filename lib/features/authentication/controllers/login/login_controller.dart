import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/loaders/loaders.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());



  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    super.onInit();
  }

  /// email and password signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog("logging you in...",
          "assets/images/animations/loader-animation.json");

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // save data if remember me
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // LOGIN USER USING EMAIL AND PASSWORD AUTHENTICATION
      final userCredentials = AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }

  /// Google sign-in
  Future<void> googleSignIn() async {
    try {
      // Show loading dialog
      TFullScreenLoader.openLoadingDialog("Logging you in...", "assets/images/animations/loader-animation.json");

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: "No Internet", message: "Please check your internet connection and try again.");
        return;
      }

      // Google authentication
      final googleUserCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user records
      await userController.saveUserRecord(googleUserCredentials);

      // Stop loading and redirect
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Stop loading and show error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap", message: "An error occurred: ${e.toString()}");
    }
  }

}
