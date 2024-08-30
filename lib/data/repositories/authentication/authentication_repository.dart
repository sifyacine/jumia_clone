import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart'; // For PlatformException

import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onboarding/onboarding_screen.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

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
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      // local storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true? Get.offAll(() => const LoginScreen()): Get.offAll(() => const OnBoardingScreen());
    }

  }


  /*------------------------------ Email and password sign-in ------------------------------*/
  /// [EmailAuthnentication] - signIn

  /// [EmailAuthnentication] - REGISTER

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }


  /// [ReAutenticate] ReAuthenticatee user
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }

  /// [EmailVerification] - mail verification

  /// [EmailAuthnentication] - forgetpassword


/*------------------------------ Email and password sign-in ------------------------------*/




/*------------------------------ o ------------------------------*/
  /// logout user
  Future<void> logout() async{
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }


}