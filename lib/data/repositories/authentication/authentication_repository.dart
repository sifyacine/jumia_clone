import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart'; // For PlatformException

import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onboarding/onboarding_screen.dart';
import '../../../utils/exceptions/exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final  _auth = FirebaseAuth.instance;


  /// called from main.dart on app launch

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// functions to show relevant screen
  screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true? Get.offAll(() => const LoginScreen()): Get.offAll(() => const OnBoardingScreen());
  }


  /*------------------------------ Email and password sign-in ------------------------------*/
  /// [EmailAuthnentication] - signIn

  /// [EmailAuthnentication] - REGISTER

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? "An error occurred with Firebase Auth");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? "A general Firebase error occurred");
    } on FormatException catch (e) {
      throw TFormatException(e.message);
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? "A platform-specific error occurred");
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }



/// [ReAutenticate] ReAuthenticatee user

  /// [EmailVerification] - mail verification

  /// [EmailAuthnentication] - forgetpassword


/*------------------------------ Email and password sign-in ------------------------------*/




/*------------------------------ Email and password sign-in ------------------------------*/



}