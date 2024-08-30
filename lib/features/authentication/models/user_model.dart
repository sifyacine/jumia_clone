import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  // Factory constructor to create a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? "",
        lastName: data['lastName'] ?? "",
        username: data['username'] ?? "",
        email: data['email'] ?? "",
        phoneNumber: data['phoneNumber'] ?? "",
      );
    } else {
      // Return a default UserModel or throw an exception if data is null
      throw Exception('Document data is null');
      // Alternatively, you could return a default empty UserModel instance
      // return UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '');
    }
  }


  // Method to convert a UserModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
  // get full name
  String get fullName => '$firstName $lastName';

  // format phone number

  String get FormattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // split full name
  static List<String> namePorts(fullName) => fullName.split(" ");

  // generate username


  // empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '');
  // Override the toString method for easy debugging
  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phoneNumber: $phoneNumber}';
  }
}
