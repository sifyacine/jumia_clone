import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data in Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      // Assuming TFirebaseException constructor accepts a message string
      throw TFirebaseException(e.message ?? "A Firebase error occurred");
    } on FormatException catch (e) {
      // Assuming TFormatException constructor accepts a message string
      throw TFormatException(e.message);
    } on PlatformException catch (e) {
      // Assuming TPlatformException constructor accepts a message string
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }
}
