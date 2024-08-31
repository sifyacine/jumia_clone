import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/loaders/loaders.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // save user record
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first and last name
        final nameParts =
        UserModel.namePorts(userCredentials.user!.displayName ?? "");
        final userName =
        UserModel.generateUserName(userCredentials.user!.displayName ?? "");

        // Map data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '');

        // Get an instance of UserRepository and save user record
        final userRepository = Get.find<UserRepository>();
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not saved",
          message: "Something went wrong while saving your information.");
    }
  }
}
